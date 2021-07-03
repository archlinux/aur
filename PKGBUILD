# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.6.0
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
sha256sums=('3dcc59e10125e0e1ae49bbe22a194cd7350351ba5bb8d0ba938732833c6656e4')

build() {
    cd "${srcdir}/pax-${pkgver}"
    echo "y" | nimble build --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
