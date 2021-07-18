# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.7.1
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
sha256sums=('c6603c8343940de0c1130bde6ce03486b9b7145f6958fbbe7d0f2927f655e56d')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble buildProd --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
