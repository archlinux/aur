# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.46
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
md5sums=('9475d53534a6498940b398c87737530a')
sha256sums=('ef25aed45454f5aeaa392956e9fb7f84a7d6675753dded9ed4f506da3091c489')
