# Maintainer: Steven Benner

pkgname='pacfinder'
pkgver='1.1'
pkgrel=1
pkgdesc='Repository & package explorer for Arch Linux.'
arch=('x86_64')
url='https://github.com/stevenbenner/pacfinder'
license=('Apache')
depends=('gtk3' 'libalpm.so>=13')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
b2sums=('26b66ecf26efe62cf8a9940fa08811981efbcb58b0f5b900bd7924cbbb9386e130dfd8d93717787b3abd3755a5fc5c84fbf607df2752ba7a74b75f82a3edc5f9')

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
