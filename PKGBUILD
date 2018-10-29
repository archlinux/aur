# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=gpresent
pkgver=2.5
pkgrel=1
pkgdesc="groff presentation macros"
arch=('x86_64')
url="https://staff.fnwi.uva.nl/b.diertens/useful/gpresent"
license=('GPL2')
depends=('groff' 'ghostscript')
options=('!strip')
source=("$url/gpresent-2.5.tar.gz")
sha256sums=('353ba4cf4ccf7b755217e6dbb68bb08b04a8f9aeadaf1ff01e7bfa293a268ece')

package() {
	install -d ${pkgdir}/usr/share/groff/site-tmac
        install -Dm644 ${srcdir}/*.tmac ${pkgdir}/usr/share/groff/site-tmac/

	install -d ${pkgdir}/usr/bin
	install -Dm755 ${srcdir}/presentps ${pkgdir}/usr/bin/presentps

	install -d ${pkgdir}/usr/share/man/man{1,7}
	install -Dm644 ${srcdir}/*.1 ${pkgdir}/usr/share/man/man1/
	install -Dm644 ${srcdir}/*.7 ${pkgdir}/usr/share/man/man7/

	install -d ${pkgdir}/usr/share/doc/gpresent
	install -Dm644 ${srcdir}/{README,*.{rof,pdf,epsf}} ${pkgdir}/usr/share/doc/gpresent/
}
