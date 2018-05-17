# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

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
depends=("sdl2" 'qt5-base')
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
source=("http://victor3d.karelia.pro/arch/executor.tar.gz")
noextract=()
md5sums=("c932297b0906c746ea5b73bfe85b58b8")
validpgpkeys=()

prepare() {
	cd "$pkgname"
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
