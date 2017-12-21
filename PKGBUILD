# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="Universal parser generator for C and Python"
arch=('i686' 'x86_64' 'armv6h')
url="https://phorward.info"
license=('BSD')
depends=('phorward>=0.21.0')
makedepends=()
checkdepends=()
#changelog=CHANGELOG
source=("https://phorward.info/products/unicc/$pkgname-$pkgver.tar.gz"
"https://phorward.info/products/unicc/unicc.pdf")
md5sums=('406390dd2bb7396154644017d29700af'
'b6b676b5e5fc3faab5cd4cb5d85ffd08')

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

