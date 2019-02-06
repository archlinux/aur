# Maintainer: Victor3D <webmaster@victor3d.com.br>
pkgname=executor
pkgver=2
pkgrel=0
epoch=
pkgdesc="old-school Macintosh Emulator "
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=("sdl2" "qt5-base")
makedepends=("cmake" "sdl2")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
noextract=()
md5sums=("ab9650aa5215a569703741b427aab061")
validpgpkeys=()

prepare() {
	cd "$pkgname"
	mkdir build
}

build() {
	cd "$pkgname"
	cd build
	cmake .. -DFRONT_END=qt
	cmake --build .
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/share/man"
	cp -Rp "usr/share/man/" "$pkgdir/usr/share"
	mkdir -p "$pkgdir/usr/bin"
	cp -Rp "usr/bin/" "$pkgdir/usr/"
	mkdir -p "$pkgdir/usr/share/applications"
	cp -Rp "usr/share/applications/" "$pkgdir/usr/share/"
	mkdir -p "$pkgdir/usr/share/doc/executor"
	cp -Rp "usr/share/doc/executor/" "$pkgdir/usr/share/doc/"
	mkdir -p "$pkgdir/usr/share/executor"
	cp -Rp "usr/share/executor/" "$pkgdir/usr/share/"
	mkdir -p "$pkgdir/usr/bin"
	cp -Rp "build/src/executor" "$pkgdir/usr/bin/executor-bin"
}
