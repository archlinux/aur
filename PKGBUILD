# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++"
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.0.1' 'lua51' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=()
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MCJack123/craftos2/archive/v2.1.1.tar.gz")
noextract=()
sha256sums=('cab561565d480cb642c299e12f57ca30637f5be2094103a69620fa46f8f640c9' 'f8ec3c98e603c760e60f8a7faf99e11eada12f66a559ecbdf5e36962af74fb04')
validpgpkeys=()

prepare() {
    true
}

build() {
	cd "craftos2-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "craftos2-$pkgver"
	make -k test
}

package() {
	cd "craftos2-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	DESTDIR="$pkgdir/usr/bin" make install
}
