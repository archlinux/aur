# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=phorward
pkgver=0.19.0
pkgrel=1
epoch=
pkgdesc="A free toolkit for parser development, lexical analysis, regular expressions and more."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.phorward.info"
license=('BSD')
makedepends=()
checkdepends=()
optdepends=('txt2tags: Documentation generator')
#changelog=CHANGELOG
source=("http://www.phorward.info/products/phorward/$pkgname-$pkgver.tar.gz")
md5sums=('a0ccd26cd5462adac4da57a25d73d4b4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

