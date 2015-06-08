# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.3.0
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=3.6.0' 'delta' 'indent' 'llvm>=3.6.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common' 'perl-sys-cpu')
source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1ae73f499cc11287537f2ea72d8f9b7d')
sha256sums=('20de354e183e95c9862895aaa3bc1c69d53a8382954c34f3ccda32e9a2dd3465')
 
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
