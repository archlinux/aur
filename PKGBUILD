# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.34
pkgrel=1
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('i686' 'x86_64')
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
md5sums=('bbe460d1e33e3c7cbe4e1d5e26a60c2d')
sha256sums=('6a6311c2cf3d533f0ac10d7e6b8c6b9ef71c6ce98a7baa2e5c8aeb7e5f91f96f')
