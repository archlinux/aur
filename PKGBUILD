pkgname="fastwm"
pkgver=1.0
pkgrel=1
arch=("x86_64")
pkgdesc="A fast experimental WM. Do not use as main WM. cr4at4d by MLevankov"
license=("GPL3")
url="https://github.com/MLevankov/FastWM"
depends=("xorg-server" "xorg-xinit" "libx11" "lib32-libx11")
makedepends=("gcc" "base-devel")
source=("main.c")
md5sums=("SKIP")

build() {
	cd "$srcdir"
	gcc -lX11 main.c -o ./fastwm
}

package() {
	cd "$srcdir"
	install -Dm777 ./fastwm "$pkgdir/usr/local/bin/fastwm"
}
