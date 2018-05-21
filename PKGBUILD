# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="armake"
pkgver=0.6.1
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
makedepends=('bison' 'flex')
source=("https://github.com/KoffeinFlummi/armake/archive/v${pkgver}.tar.gz")
sha256sums=('4afb8f7fe648fd6307a4e6f0609814f14eed42918ddf072f9f6b8d80d2b42bb9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
