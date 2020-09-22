# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=1.3.2
pkgrel=2
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
depends=('python' 'python-click' 'python-colored' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/bexxmodd/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d6494a72460216225317807ec6203976f58b1c845718458f4dcfa64a5b93fa5f')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
