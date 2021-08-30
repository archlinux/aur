# Maintainer: nytpu <alex at nytpu dot com>
# Send patches or reports to the mailing list linked at:
# https://git.sr.ht/~nytpu/PKGBUILDs/

pkgname=netbsd-curses
pkgver=0.3.2
pkgrel=1
pkgdesc="Port of NetBSD's curses library for usage on all POSIX systems"
arch=('x86_64')
url="https://github.com/sabotage-linux/netbsd-curses"
license=('BSD')
provides=('libcurses' 'libterminfo')
depends=('bash')
conflicts=('ncurses')
source=("http://ftp.barfooze.de/pub/sabotage/tarballs/${pkgname}-${pkgver}.tar.xz")
sha512sums=('2f5604782599f07ee8c54bbf98fa7f8b1c13a26b3e194a4b4ac756f8b23448d1d3cb65223f39de304f34322b73deec6ccfa93cd4a606b2ed56308de730d6593e')

build() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="/usr" all
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
