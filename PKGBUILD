# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adrelanos
pkgname=tor-ctrl
pkgver=7.2
pkgrel=1
pkgdesc="Tor control port command line tool"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0-or-later')

makedepends=('pandoc')
depends=('bash' 'safe-rm')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('505d0442ede2beb80dfe20a05a47abdd7d472cc1daa8d62a0922352a238b371b')


package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	for bin in "./usr/bin/${pkgname}"*; do
		install -Dm755 ${bin} "${pkgdir}/${bin}"
	done

	install -Dm644 "./auto-generated-man-pages/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
