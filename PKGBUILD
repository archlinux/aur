# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="armake"
pkgver=0.5
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
source=("https://github.com/KoffeinFlummi/armake/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
} 

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
