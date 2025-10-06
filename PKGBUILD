# Maintainer: Frosty <frosty@archtide.space>

pkgname=sandscreen
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal screensaver built on ncurses"
arch=(x86_64)
url="https://github.com/frostyarchtide/sandscreen"
license=("MIT")
depends=()
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/frostyarchtide/sandscreen/archive/v${pkgver}.tar.gz")
sha256sums=("7f36ed7dcf2182fea95ec3af7c4d5e6eb3e8cbca8f8f90ab5b79c2611440db21")

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
