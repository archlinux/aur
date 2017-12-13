# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=phorward
pkgver=0.21.0
pkgrel=1
epoch=
pkgdesc="A free C library for parser development, lexical analysis, regular expressions and more."
arch=('i686' 'x86_64' 'armv6h')
url="https://phorward.info"
license=('BSD')
makedepends=()
checkdepends=()
optdepends=('txt2tags: Documentation generator')
#changelog=CHANGELOG
source=("https://phorward.info/download/phorward/$pkgname-$pkgver.tar.gz")
md5sums=('0a584b69b01c2ada9249eb6b34da92a0')

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

