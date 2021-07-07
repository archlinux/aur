# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.7.0
pkgrel=1
pkgdesc="The MC modpack manager for professionals."
arch=('x86_64')
url="https://github.com/froehlicha/pax"
license=('MIT')
makedepends=('git' 'nim' 'nimble')
provides=('pax-mc')
conflicts=('pax-mc-bin' 'pax-mc-git')
replaces=()
changelog=
source=("pax-${pkgver}.tar.gz::https://github.com/froehlichA/pax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d181ee613a6670c5c7db79169adcac2392d2b065fff6459b75f4a810ce575571')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble buildProd --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
