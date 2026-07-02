# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Vladimir-csp
pkgname=app2unit
pkgver=1.4.2
pkgrel=1
pkgdesc="Utility to launch commands as systemd user units"

url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0-only')
arch=('any')

provides=("${pkgname}" "${pkgname}-open" "${pkgname}-open-scope" "${pkgname}-open-service" "${pkgname}-term" "${pkgname}-term-scope" "${pkgname}-term-service")

makedepends=('make' 'scdoc')
depends=('sh' 'systemd' 'libnotify')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0b75858ac71ca9f7b9618d2e87d12dd62221d3c3f401c4b7cb533aad3f1ddeff')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	DESTDIR="${pkgdir}" prefix='/usr' make install

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
