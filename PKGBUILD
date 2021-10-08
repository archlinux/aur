# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

pkgname=porth-git
pkgver=1.0
pkgrel=1
pkgdesc="It's like Forth but in Python"
arch=('x86_64')
url="https://github.com/tsoding/porth.git"
license=('MIT')
depends=('nasm' 'binutils' 'python')
makedepends=('git' 'python')
source=("git+https://github.com/tsoding/porth.git")
sha256sums=('SKIP')

check() {
	cd "$srcdir/${pkgname%-git}"
	python test.py
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/${pkgname%-git}/examples"
	cp -R "examples/" "$pkgdir/usr/share/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	cp -RT "std/" "$pkgdir/usr/lib/${pkgname%-git}/"
	mkdir -p "$pkgdir/usr/bin"
	cp "porth.py" "$pkgdir/usr/bin/${pkgname%-git}"
}
