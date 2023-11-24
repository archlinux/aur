# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=printer-git
pkgver=1
pkgrel=1
pkgdesc="Ncurses like c library"
arch=(x86_64)
url="https://github.com/spynetS/printer"
license=('MIT')
makedepends=(gcc git)
source=( "git+$url.git" )
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd printer 
	./build.sh
}

package() {
	cd printer 
	cd build
	install -Dm755 "./libprinter.so" "$pkgdir/usr/lib/libprinter.so"
	install -Dm655 "../src/printer.h" "$pkgdir/usr/include/printer.h"
}
              
