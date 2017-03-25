# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.6.0
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
md5sums=('6bcf75d9d3e808c96ff837e35f23767d')
sha256sums=('cdacc1046ca3ae2b0777b8f235428e7976b0fb97c2f69979c8accd8d2cc0c55d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
