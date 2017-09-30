# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvolasdk
pkgver=4.7.0
pkgrel=1
pkgdesc="NuvolaSDK"
arch=("any")
url="https://github.com/tiliado/nuvolasdk"
license=('custom:BSD')
makedepends=('scour')
depends=('imagemagick')
provides=('python-nuvolasdk')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('5d22c985446d83a93040082057187d2419ce5dc8f6b6cc82ee20238515656fe0')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python3 setup.py install --prefix="/usr" --root="${pkgdir}"
}
