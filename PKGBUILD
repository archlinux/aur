# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.45
pkgrel=1
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk' 'flxmlrpc')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'fldigi: for digital mode interface')
provides=('flrig')
conflicts=('flrig-git')
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
}

check() {
	cd $srcdir/$pkgname-$pkgver

	make -k check
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('984fa1828d2a3d854bc56f5b94fea996')
sha256sums=('5b68785114e8ac3128e85b6fc20518479e6d5e741d1e7a0410b28c4939f63693')
