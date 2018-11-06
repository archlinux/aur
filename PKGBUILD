# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.8.0
_commit=8ad1b4021a1d46f9b448d7c1b9fb01aca4a35b55
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=5.0.0' 'indent' 'llvm>=5.0.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common' 'perl-sys-cpu')
#source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz")
source=("$pkgname-$_commit.tar.gz::https://github.com/csmith-project/creduce/archive/$_commit.tar.gz")
md5sums=('faa788c48960804fbc75e2b150b05513')
sha256sums=('e2dd8a3c5e86199ab6fef832ff728dde7affaa7c32fce8c341a229080bb256b5')

build() {
	cd "$pkgname-$_commit"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$_commit"
	make install DESTDIR="$pkgdir/"
}
