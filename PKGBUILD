# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=phorward
pkgver=0.20.0
pkgrel=1
epoch=
pkgdesc="A free toolkit for parser development, lexical analysis, regular expressions and more."
arch=('i686' 'x86_64' 'armv6h')
url="https://phorward.info"
license=('BSD')
makedepends=()
checkdepends=()
optdepends=('txt2tags: Documentation generator')
#changelog=CHANGELOG
source=("https://phorward.info/products/phorward/$pkgname-$pkgver.tar.gz")
md5sums=('1ceb888d26fb4330ec24be0e94048c05')

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

