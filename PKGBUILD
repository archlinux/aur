# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=vattery
pkgver=0.7.5
pkgrel=3
pkgdesc="A GTK battery monitor for the sys-tray"
url="http://www.jezra.net/projects/vattery"
#groups=()
depends=('gtk2' 'librsvg' 'acpi')
makedepends=('gcc' 'make' 'intltool' 'pkgconfig')
license=(GPL)
source=(http://launchpad.net/$pkgname/0.7/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('5d02a99b4579b2816f71b25ba7ba0f6c')
arch=('i686' 'x86_64')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr/
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
