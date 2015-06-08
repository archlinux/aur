# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.6.0
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.8.1')
checkdepends=('cppunit')
source=("https://github.com/scrm/scrm/releases/download/v$pkgver/scrm-src.tar.gz")
sha256sums=('f7ab5cea3c722ba2a25b53526447c4f3b7968bd675afe4bdbed692abf8cd7075')
md5sums=('6dbb8ead1d7d0374a4c5c439d2538a23')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k unittests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
