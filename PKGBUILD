# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Universal, target-language independent LALR(1) parser generator"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.phorward.info"
license=('BSD')
depends=('phorward')
makedepends=()
checkdepends=()
#changelog=CHANGELOG
source=("http://www.phorward.info/products/unicc/$pkgname-$pkgver-source.tar.gz"
"http://www.phorward.info/products/unicc/unicc.pdf")
md5sums=('5411db004a8bbde40670e72427e95d1a'
'c0e4266f171e391d1af601882f7e80b3')

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
	cd ..
	cp unicc.pdf $pkgdir/usr/share/unicc
}

