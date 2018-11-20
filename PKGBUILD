# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.5.0
pkgrel=1
epoch=
pkgdesc="Universal LALR(1) parser generator for C, C++, Python, JavaScript, JSON and XML"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://phorward.info"
license=('BSD')
depends=('phorward>=0.23.0')
makedepends=()
checkdepends=()
#changelog=CHANGELOG
source=("https://phorward.info/download/unicc/$pkgname-$pkgver.tar.gz"
"https://phorward.info/download/unicc/unicc.pdf")
md5sums=('284e8a79fee3ecc5d62692929e8390ac'
'819ed3c151080f36388e29e216956984')

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
	cd ..
	cp unicc.pdf $pkgdir/usr/share/unicc
}

