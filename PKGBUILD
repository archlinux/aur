# Maintainer: Marco Asa <marcoasa90 [at] gmail [dot] com>
pkgname=eperiodique
pkgver=0.4
pkgrel=1
pkgdesc="A simple Periodic Table Of Elements viewer using elementary and edje"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eperiodique/"
license=('GPL')
depends=('elementary' 'edje' 'gettext')
install=
source=(http://downloads.sourceforge.net/project/eperiodique/0.4/eperiodique-0.4.tar.bz2)
md5sums=('163f6ab416183bb4fc6fc035a620c551')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
