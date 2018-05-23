# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="armake"
pkgver=0.6.3
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
makedepends=('bison' 'flex')
source=("https://github.com/KoffeinFlummi/armake/archive/v${pkgver}.tar.gz")
sha256sums=('1c3010d4745851b91129367197e9066281ad1dbbe015e9fa5b25a386509ff408')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
