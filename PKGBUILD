# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=2.0.1
pkgrel=4
pkgGitHubCommit=fc94e49
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/juddmon/jpilot/"
license=('GPL2')
depends=('openssl' 'gtk3' 'pilot-link' 'slang')
makedepends=('intltool')
source=("https://codeload.github.com/juddmon/jpilot/legacy.tar.gz/$pkgGitHubCommit")
sha256sums=('2b89f5d1b14d8ca6e6ae2457c8209aa304658cd605f3f86e2f7a060d63352b4a')

build() {
	cd "${srcdir}"/juddmon-$pkgname-$pkgGitHubCommit

	./autogen.sh --prefix=/usr --disable-pl-test --disable-gtktest
	make
}

package() {
	cd "${srcdir}"/juddmon-$pkgname-$pkgGitHubCommit

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

