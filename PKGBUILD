# Maintainer: bellotto <joangarcez2100@gmail.com>

pkgname=porth-gitlab
pkgver=0.01
pkgrel=1
pkgdesc="[Unstable/W.I.P] It's like Forth but in Python."
arch=('x86_64')
url="https://gitlab.com/tsoding/porth.git"
license=('MIT')
depends=('nasm' 'binutils' 'fasm')
makedepends=('git' 'python')
source=("git+https://gitlab.com/tsoding/porth.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/porth"
	./porth.py com porth.porth
}

package() {
	cd "$srcdir/porth"
	
	mkdir -p "$pkgdir/usr/share/${pkgname%-gitlab}/examples"
	cp -R "examples/" "$pkgdir/usr/share/${pkgname%-gitlab}"
	
	mkdir -p "$pkgdir/usr/lib/${pkgname%-gitlab}"
	cp -RT "std/" "$pkgdir/usr/lib/${pkgname%-gitlab}/"
	
	mkdir -p "$pkgdir/usr/bin/"
	cp "porth" "$pkgdir/usr/bin/${pkgname%-gitlab}"
	
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-gitlab}/"
	cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-gitlab}/"
}
