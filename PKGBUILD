# Maintainer: HD63B09P <iris dot teyssier at gmail dot com>
pkgname=asm6809
pkgver=2.17
pkgrel=1
pkgdesc="asm6809 portable cross assembler targeting the Motorola 6809 and Hitachi 6309"
arch=('x86_64')
url="https://www.6809.org.uk/asm6809/"
license=('GPL-3.0-or-later')
source=(
    "$url/dl/$pkgname-$pkgver.tar.gz"
)
sha256sums=('a6d36dd29cb3b26505c46595c1f0f1c4d7e66d3838f6347ce33ce27f4b35cffa')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
