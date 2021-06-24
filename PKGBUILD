# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.4.1
pkgrel=2
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
sha256sums=('73b95db266f9ac5f6ddb35c562db74c0e6a8cfa606d0faeef1d3de448badfe06')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble build --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
