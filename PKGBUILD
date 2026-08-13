# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Vladimir-csp
pkgname=app2unit
pkgver=1.4.4
pkgrel=1
pkgdesc="Utility to launch commands as systemd user units"

url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0-only')
arch=('any')

provides=("${pkgname}" "${pkgname}-open" "${pkgname}-open-scope" "${pkgname}-open-service" "${pkgname}-term" "${pkgname}-term-scope" "${pkgname}-term-service")

makedepends=('make' 'scdoc')
depends=('sh' 'systemd' 'libnotify')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('03c1206097a1596c0e49dc48b82d0b602cc9f38cc498542fe27ef613a050d6fc')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	DESTDIR="${pkgdir}" prefix='/usr' make install

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
