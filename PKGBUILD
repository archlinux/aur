# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.3.2
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
source=("https://phorward.info/download/unicc/$pkgname-$pkgver.tar.gz"
"https://phorward.info/download/unicc/unicc.pdf")
md5sums=('d2f4e97e06bc3c849e9ab1a70c3686b4'
'9811c687109166f57537177b9da1b31f')

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

