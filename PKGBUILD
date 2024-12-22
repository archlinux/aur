# Maintainer: Charles Dong <chardon_cs@proton.me>
pkgname=hyprland-qtutils
pkgver=0.1.1
pkgrel=2
epoch=
pkgdesc="Hyprland Qt/QML utility apps"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprland-qtutils"
license=('BSD-3-Clause')
groups=()
depends=(
    'qt6-base'
    'qt6-wayland'
    'pkg-config'
    'hyprutils'
)
makedepends=(
    'gcc'
    'cmake'
    'ninja'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/hyprwm/hyprland-qtutils/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    '3d88e7aaea9ad1c5dc7703d43e4021f06e3f582a656a7592708d8204a272236c'
)
validpgpkeys=()

build() {
    cd $srcdir/${pkgname}-$pkgver
    cmake -B ./build -G Ninja -D CMAKE_BUILD_TYPE=Release
    cmake --build ./build
}

package() {
    cd $srcdir/${pkgname}-$pkgver/build
    cmake --install . --prefix $pkgdir/usr
}
