# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=phorward
pkgver=0.18.0
pkgrel=1
epoch=
pkgdesc="C library and tools for regular expressions, lexical analysis, parsing and more."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.phorward.info"
license=('BSD')
depends=('txt2tags')
makedepends=()
checkdepends=()
#optdepends=('txt2tags: Documentation generator')
#changelog=CHANGELOG
source=("http://www.phorward.info/products/phorward/$pkgname-$pkgver-source.tar.gz")
md5sums=('b2938fdbf207736bfbfa8100342c5865')

prepare() {
	cd "$pkgname-$pkgver-source"
	echo "<html>Documentation coming soon.</html>" >doc/phorward.html
}

build() {
	cd "$pkgname-$pkgver-source"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver-source"
	make -k check
}

package() {
	cd "$pkgname-$pkgver-source"
	make DESTDIR="$pkgdir/" install
}

