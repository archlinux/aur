# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Patrik Hautala <phloyd@iki.fi>

pkgname=moe
pkgver=1.12
pkgrel=1
pkgdesc='A powerful, 8-bit clean, text editor. Supports ISO-8859-15 and ASCII.'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/moe/moe.html'
license=('GPL')
depends=('ncurses')
backup=('etc/moerc')
source=(http://ftpmirror.gnu.org/moe/$pkgname-$pkgver.tar.lz)
md5sums=('15a7452b6fa5083a0e53e0ac616fa1d4')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc \
		CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
