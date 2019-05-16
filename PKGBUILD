# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.10.0
#_commit=fb91843c547794f165e5764a003166191e6c6643
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=8.0.0' 'indent' 'llvm>=8.0.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common' 'perl-sys-cpu')
source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ec9d5fd3c71840c7361cdf626fe1f202')
sha256sums=('db1c0f123967f24d620b040cebd53001bf3dcf03e400f78556a2ff2e11fea063')
#source=("$pkgname-$_commit.tar.gz::https://github.com/csmith-project/creduce/archive/$_commit.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
