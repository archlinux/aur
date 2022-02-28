# Maintainer: Steven Benner

pkgname='pacfinder'
pkgver='1.0'
pkgrel=1
pkgdesc='Repository & package explorer for Arch Linux.'
arch=('x86_64')
url='https://github.com/stevenbenner/pacfinder'
license=('Apache')
depends=('gtk3' 'libalpm.so>=13')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
b2sums=('1cb9de3b14995ac33ffa2856ed80095361c23504730dfb84ee5a66303ad4d05e7d7bb1f249c51157734105427812f276a69a3f5b7e38ddde534430c6ca84c7a3')

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
