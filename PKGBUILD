# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Universal parser generator for C and Python"
arch=('i686' 'x86_64' 'armv6h')
url="https://phorward.info"
license=('BSD')
depends=('phorward')
makedepends=()
checkdepends=()
#changelog=CHANGELOG
source=("https://phorward.info/products/unicc/$pkgname-$pkgver.tar.gz"
"https://phorward.info/products/unicc/unicc.pdf")
md5sums=('fa8bc7f8cdead9fa381279d35b4a20fa'
'c09eacd1b6cee1a48c67e80d04253191')

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

