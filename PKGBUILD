# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="armake"
pkgver=0.6
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
makedepends=('bison' 'flex')
source=("https://github.com/KoffeinFlummi/armake/archive/v${pkgver}.tar.gz")
sha256sums=('203631bce259d06d74fdae683b1aa755bf4ec9bc6b96c4e3a3b326d7b428350c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
