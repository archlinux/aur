# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=goatattack-server
_dlname=goatattack
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("libpng")
makedepends=("gc")
source=("http://www.goatattack.net/installers/$_dlname-$pkgver.tar.gz")
md5sums=('275950eec2040e44f2e125b037c1ea02')

prepare() {
	cd "$srcdir/$_dlname-$pkgver"
	./configure --prefix=/usr --enable-dedicated-server --program-suffix="-server" --datadir="/usr/share/$pkgname"
}

build() {
	cd "$srcdir/$_dlname-$pkgver"
	make
}

check() {
	cd "$srcdir/$_dlname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_dlname-$pkgver"
	make DESTDIR="$pkgdir/" install
}