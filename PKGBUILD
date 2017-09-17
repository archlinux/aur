# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=4.0.0' 'indent' 'llvm>=4.0.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common' 'perl-sys-cpu')
source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4ac7f2498d830373937b726f6712f7bb')
sha256sums=('36dca859c97a988e71b1a08e0cbd5849e4da051d248c5e483494194c4a231a41')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
