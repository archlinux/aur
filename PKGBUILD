# Maintainer: nicolarevelant44 <nicolarevelant44@outlook.com>

pkgname=italian-draughts-git
pkgver=1.3.2.r0.g6aa8819
pkgrel=1
pkgdesc="Italian Draughts, a strategy game for 2 players written in C++"

arch=("x86_64")
depends=("wxwidgets-gtk3")
license=("GPL3")
makedepends=("git" "cmake" "scdoc")
source=("$pkgname"::"git+https://github.com/nicolarevelant/italian-draughts.git")
url="https://github.com/nicolarevelant/italian-draughts"
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE="Release"
	cmake --build build
}

package() {
	cd "$pkgname"
	cmake --install build --prefix $pkgdir
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

