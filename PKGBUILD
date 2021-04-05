# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Patrik Hautala <phloyd@iki.fi>

pkgname=moe
pkgver=1.11
pkgrel=1
pkgdesc='A powerful, 8-bit clean, text editor. Supports ISO-8859-15 and ASCII.'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/moe/moe.html'
license=('GPL')
depends=('ncurses')
backup=('etc/moerc')
source=(http://ftpmirror.gnu.org/moe/$pkgname-$pkgver.tar.lz)
md5sums=('ccd9326e87f28ad584d638910ab45a87')

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
