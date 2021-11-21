# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.4.3
pkgrel=1
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk' 'systemd-libs')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'fldigi: for digital mode interface')
provides=('flrig')
conflicts=('flrig-git')
source=(https://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)

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
md5sums=('e0608fbc65585a742cc93207f58f1f57')
sha256sums=('f0f0690c28ca78a8d8bae10cab82af966e06d1ab2e9b1b580718c0f21dfee307')
