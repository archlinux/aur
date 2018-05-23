# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="armake"
pkgver=0.6.2
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
makedepends=('bison' 'flex')
source=("https://github.com/KoffeinFlummi/armake/archive/v${pkgver}.tar.gz")
sha256sums=('e4fc0f0370d385d394ba0778688ad056dd669815b2991a06b9574e09c69cfc4c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
