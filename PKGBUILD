# Maintainer: Frosty <frosty@archtide.space>

pkgname=sandscreen
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal screensaver built on ncurses"
arch=(x86_64)
url="https://github.com/frostyarchtide/sandscreen"
license=("MIT")
depends=()
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/frostyarchtide/sandscreen/archive/v${pkgver}.tar.gz")
sha256sums=("dfd4c2e57a43b2694843e4ff58bff36886d2ea11343a0a75981aac4e8229ee03")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build -S .
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd build
    install -Dm755 sandscreen "${pkgdir}/usr/bin/sandscreen"
}
