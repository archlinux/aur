# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=adrelanos
pkgname=tor-ctrl
pkgver=7.3
pkgrel=1
pkgdesc="Tor control port command line tool"

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${pkgauthor}/${pkgname}"

makedepends=('pandoc')
depends=('bash' 'safe-rm')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('45c0542d79bfd5648249f7b8e5c944ef64dcfc29b61a54dfe894b24ccc0c4d98')


package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	for bin in "./usr/bin/${pkgname}"*; do
		install -Dm755 ${bin} "${pkgdir}/${bin}"
	done

	install -Dm644 "./auto-generated-man-pages/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
