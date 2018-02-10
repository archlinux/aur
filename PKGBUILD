# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.7.0
_commit=de21e365e218d36caac5e05a220a26dca68ea920
pkgrel=2
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
md5sums=('0d6b4b99bd1d0eea470ec43621dc1b75')
sha256sums=('4f24c8efe1a7edb440c71719a0a117d55b9c235e3256c8253d3e56d925682a26')

build() {
	cd "$pkgname-$_commit"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$_commit"
	make install DESTDIR="$pkgdir/"
}
