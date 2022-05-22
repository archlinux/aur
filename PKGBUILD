# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=tspacketchk
pkgver=1.0.0
pkgrel=1
pkgdesc='MPEG-2 TS packet integrity check program'
arch=('any')
url="https://github.com/kaikoma-soft/tspacketchk"
license=('Apache')
source=("https://github.com/kaikoma-soft/${pkgname}/archive/Ver${pkgver}.tar.gz")

# For 32-bit machines
sha256sums=('e5c8b3efb7f9e25397f389ca1371ead9a306714c85ab612e1db18d31beb8c680')

# For 64-bit machines
sha512sums=('0d8a7a61bec7106464bb3d37585d1053e4e96ddebffb1c3e96d88232b673dfdc96f914fefe3edb463d09ba1aad1c28f3d51e8cf4d0602fe769b561a61d58bee1')

build() {
    cd "${srcdir}/${pkgname}-Ver${pkgver}/"
    make
}

package() {
    cd "${srcdir}/${pkgname}-Ver${pkgver}/"
    
    mkdir -p "${pkgdir}/usr/bin"
    make DEST="${pkgdir}/usr/bin" install
}

