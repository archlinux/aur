# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=3.8.0' 'indent' 'llvm>=3.8.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common' 'perl-sys-cpu')
source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6080accb71222c642d81f661162a35c4')
sha256sums=('2dcd784e1d27df60f4ea1d92c4c556c02da4152db353d544dce8b7813fa443e4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
