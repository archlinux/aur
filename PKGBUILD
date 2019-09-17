# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=trayclock
pkgver=0.3.7
pkgrel=4
pkgdesc="trayclock is a simple analog clock for the sys-tray"
url="http://www.jezra.net/projects/trayclock"
#groups=()
depends=('gtk2' 'librsvg')
makedepends=('gcc' 'make' 'intltool' 'pkgconfig')
license=("GPL")
source=(http://launchpad.net/$pkgname/0.5/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('f36e4e8a487b52d56d16eda208d74e74')
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
