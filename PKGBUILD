# Maintainer: nicolarevelant44 <nicolarevelant44@outlook.com>

pkgname=italian-draughts-git
pkgver=1.3.1.r0.g7ff0641
pkgrel=1
pkgdesc="Italian Draughts, a strategy game for 2 players written in C++"
license=("GPL3")
makedepends=("wxwidgets-gtk3" "git" "cmake" "make" "scdoc")
depends=("wxwidgets-gtk3")
arch=("x86_64")
source=("$pkgname"::"git+https://gitlab.com/nicolarevelant44/italian-draughts.git")
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

