pkgname=gf2
pkgver=20251231
pkgrel=1
pkgdesc="A GDB frontend for Linux."
arch=(x86_64)
url="https://github.com/nakst/gf"
license=('MIT')
depends=(gdb freetype2 libx11)
optdepends=('vim: enhanced source viewing')
makedepends=(git)
source=("git+$url?commit=9a5dbcc90dc9ca9580f6ce2854cd67e2e507b0c1")
b2sums=('SKIP')

prepare() {
	cd gf
	mv extensions_v5/extensions.cpp .
}

build() {
	cd gf
	./build.sh
}

package() {
	cd gf
	install -D $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
