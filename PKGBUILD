# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.12 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom-sh"
pkgver=050706
pkgrel=3
pkgdesc="Traditional sh derived from OpenSolaris code"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('BSD' 'CDDL')
conflicts=("$pkgname-cvs")
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff')
md5sums=('9169d9b3b845cb63c598ea29b8d2dfa0'
         '991b32bee780ce48685dfd4d39d41443')

build() {
	cd "$pkgname-$pkgver"
	
	patch -p1 < ../000-config.diff

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install ROOT="$pkgdir"

	install -Dm644 CALDERA.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}
