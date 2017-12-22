# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvolasdk
pkgver=4.9.0
pkgrel=1
pkgdesc="NuvolaSDK"
arch=("any")
url="https://github.com/tiliado/nuvolasdk"
license=('custom:BSD')
makedepends=('scour')
depends=('imagemagick')
provides=('python-nuvolasdk')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e2c2d378e0506179011b004ef367e36c2a60b38fa20408bcacdb75f1caffb9d4')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py install --prefix="/usr" --root="${pkgdir}"
}
