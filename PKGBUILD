# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.8.0
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
sha256sums=('5b4f8bf527fda98366860a0537baa89117dda5e7c8ef3ffbcfd1a24dbfbb4f6e')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble buildProd --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
