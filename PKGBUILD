# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.6
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
sha256sums=('fbe9ed89c1a46607374a9e2b8f9adec1876be2baa0fb1fd2e55644d41eb9830d')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble buildProd --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
