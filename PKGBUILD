# Maintainer: 0zd0 <shpilvk@gmail.com>
pkgname=zdhpctl
pkgver=1.12
pkgrel=1
pkgdesc="hyprctl extension"
arch=('x86_64')
url="https://github.com/0zd0/zdhpctl"
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
depends=(
	'libxkbcommon'
	'jsoncpp'
	'fmt'
)
optdepends=(
    'hyprland: For stable Hyprland users'
    'hyprland-git: For users of the development version'
)
makedepends=(
	'git'
	'cmake'
	'make'
	'gcc'
)
sha256sums=('eb3a122a32064ec1e38e79a7da62868989a73ba24b0e17654039ae81f417f394')

build() {
    cd "$pkgname-$pkgver"

    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"

    cmake --install build --prefix="$pkgdir/usr"
}
