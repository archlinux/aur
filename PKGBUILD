# Maintainer: Kevin Budz <https://github.com/kevinbudz>
pkgname=plasma6-applets-quickbar
pkgver=0.2.0
pkgrel=1
pkgdesc="Configurable Plasma 6 global menu panel widget (QuickBar)"
arch=('x86_64' 'aarch64')
url="https://github.com/kevinbudz/quickbar"
license=('GPL-2.0-or-later')
depends=(
    'libplasma'
    'plasma-workspace'
    'qt6-base'
    'qt6-declarative'
    'kconfig'
    'kcoreaddons'
    'ki18n'
    'kwindowsystem'
    'kirigami'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'gcc'
    'kitemmodels'
    'libxtst'
)
optdepends=(
    'dolphin: Finder-style desktop menu (Dolphin menu bar on desktop)'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c7cd6d4de5ffcce9d8d9507defb69cc440fc2100559b5a17678c983221631109')

build() {
    cmake -B build -S "quickbar-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
