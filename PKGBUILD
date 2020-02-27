# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=1.8.2
pkgrel=4
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://github.com/juddmon/jpilot/"
license=('GPL2')
depends=('openssl' 'gtk2' 'pilot-link')
makedepends=('intltool')
source=(https://codeload.github.com/juddmon/jpilot/legacy.tar.gz/6aaded5)
sha256sums=('44d3022ca02659954acb28296034b6845af3e91750b758f7bb1288b228be079f')

build() {
	cd "${srcdir}"/juddmon-$pkgname-6aaded5

	./autogen.sh --prefix=/usr --disable-pl-test --disable-gtktest
	make
}

package() {
	cd "${srcdir}"/juddmon-$pkgname-6aaded5

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

