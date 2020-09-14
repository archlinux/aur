# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=1.1.0
pkgrel=1
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
depends=('python' 'python-click' 'python-colored' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
source=(https://github.com/bexxmodd/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('5bfce1da6fd2635b1c5399d66eceb6226829742a40c083b639f4b5b9a1931d67')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
