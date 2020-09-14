# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=1.0
pkgrel=1
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
depends=('python' 'python-click' 'python-colored' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
source=(https://github.com/bexxmodd/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('77cf21f4d7a78b18cf6f804c7e371b42d599b4d9c7ae7b9a1784db74a9320889')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
