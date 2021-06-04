# Maintainer: Julian Daube <julian (at) daube (dot) xyz> 
# Contributor: Julian Daube <julian (at) daube (dot) xyz>
pkgname=istyle-verilog-formatter-git
pkgdesc="Fast and Free Automatic Formatter for Verilog Source Code"
pkgver=v1.23.r0.g3ec7507
pkgrel=1

url="https://github.com/thomasrussellmurphy/istyle-verilog-formatter"
arch=("x86_64")

provides=("istyle-verilog-formatter")
conflicts=("istyle-verilog-formatter")

makedepends=("make")

source=("$pkgname::git+https://github.com/thomasrussellmurphy/istyle-verilog-formatter.git")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make 
}

package() {
	mkdir -p "$pkgdir"/usr/bin	
	install -m 755 "$srcdir/$pkgname/bin/release/iStyle" "$pkgdir"/usr/bin/iStyle	
}
