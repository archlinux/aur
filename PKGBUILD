
# Maintainer: kcrmson <cory@fuckyouprius.com>
pkgname='stuffit-bin'
_pkgname='stuffit'
pkgver=5.2.0.611
pkgrel=1
pkgdesc="Decompress .SIT archives for System 7 era Macintoshes, by Aladdin Systems, Inc., from 2001"
arch=('any')
url="http://www.aladdinsys.com"
license=('unknown')
provides=('stuff' 'unstuff')
conflicts=('stuff' 'unstuff')
options=('!strip')
source=("http://web.archive.org/web/20060205025441/http://www.stuffit.com/downloads/files/stuffit520.611linux-i386.tar.gz")
sha256sums=('c53ff401a98dab1c262d672f2214dfea2c16bc300f0eaa719ff3d46b66256223')

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/man/man1"
	install -dm755 "${pkgdir}/usr/share/stuff"
	install -dm755 "${pkgdir}/usr/share/unstuff"

	# Program
	install -Dm755 "${srcdir}/bin/stuff" "${pkgdir}/usr/bin/stuff"
	install -Dm755 "${srcdir}/bin/unstuff" "${pkgdir}/usr/bin/unstuff"
	install -Dm755 "${srcdir}/bin/register" "${pkgdir}/usr/bin/register-stuff"

	# Man pages
	install -Dm644 "${srcdir}/man/man1/stuff.1" "${pkgdir}/usr/share/man/man1/"
	install -Dm644 "${srcdir}/man/man1/unstuff.1" "${pkgdir}/usr/share/man/man1/"

	# Licenses and docs
	install -Dm644 "${srcdir}/doc/stuff"/* -t "${pkgdir}/usr/share/stuff"
	install -Dm644 "${srcdir}/doc/unstuff"/* -t "${pkgdir}/usr/share/unstuff"
}
