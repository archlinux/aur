# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=1.5.1
pkgrel=1
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
depends=('python' 'python-click' 'python-colored' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/bexxmodd/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('ef0df47c9125b0df85a11ca242e4b97a874831065ce6333eb2fe3739d33043d6')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
