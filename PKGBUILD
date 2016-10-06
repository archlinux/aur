# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=vavrdisasm
pkgver=3.1
pkgrel=1
pkgdesc="An 8-bit Atmel AVR disassembler"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/vsergeev/vavrdisasm"
license=('GPL3')
depends=('glibc')
source=("git+https://github.com/vsergeev/vavrdisasm.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
