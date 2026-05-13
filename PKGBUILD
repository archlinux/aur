# Maintainer : cmach_socket <cmach_socket@outlook.com>
pkgname=niripwmenu-reborn
pkgver=0.1
pkgrel=1
pkgdesc="Power menu widget for niri (Wayland)"
arch=("any")
url="https://github.com/cmachsocket/niripwmenu-reborn"
license=("MIT")
depends=("qt6-base" "qt6-declarative")
makedepends=("cmake" "ninja" "pkgconf")
optdepends=("niri: for logoff command")
source=("git+https://github.com/cmachsocket/niripwmenu-reborn.git#branch=noStyleKit")
sha256sums=('SKIP')

build() {
    cmake -S niripwmenu-reborn -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    install -Dm755 build/niripwmenu_reborn "$pkgdir/usr/bin/niripwmenu-reborn"
}
