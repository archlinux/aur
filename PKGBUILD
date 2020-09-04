# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Convert remind(1) entries to iCalendar .ics format'
pkgname=remmy
pkgver=0.20191227
pkgrel=1
_commit=c42d400ed933da625b5ea25be06ef51c2b22d59f
url=https://github.com/smartmic/remmy
arch=(any)
makedepends=(git)
depends=(perl-uuid-tiny perl-datetime)
source=("${pkgname}-${pkgver}::git+${url}#commit=${_commit}")
sha512sums=(SKIP)

build () {
	cd "${pkgname}-${pkgver}"

	# Extract manual page
	pod2man -v remmy.pl remmy.1
}

package () {
	cd "${pkgname}-${pkgver}"

	install -Dm755 remmy.pl "${pkgdir}/usr/bin/remmy"
	install -Dm644 -t "${pkgdir}/usr/share/man/man1/" remmy.1
}
