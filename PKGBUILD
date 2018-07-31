# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvolasdk
pkgver=4.12.0
pkgrel=1
pkgdesc="NuvolaSDK"
arch=("any")
url="https://github.com/tiliado/nuvolasdk"
license=('custom:BSD')
makedepends=('scour')
depends=('imagemagick' 'python-pillow')
provides=('python-nuvolasdk')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('159a731127373a092421290dd61b0c25938948e0d348d2fc97cf44384ddc106d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py install --prefix="/usr" --root="${pkgdir}"
}
