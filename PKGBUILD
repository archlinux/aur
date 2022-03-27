# Maintainer: Steven Benner

pkgname='pacfinder'
pkgver='1.2'
pkgrel=1
pkgdesc='Pacman repository & package explorer for Arch Linux.'
arch=('x86_64')
url='https://github.com/stevenbenner/pacfinder'
license=('Apache')
depends=('gtk3' 'libalpm.so>=13')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
b2sums=('186108a70d3dd3a72a92f5fe4c9622744442d3492b749b0f5e2d56078f5c9107fc9f83697065b0b02369e58ecde172331f6d6b1fb5a72ab5baece965f887463d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
