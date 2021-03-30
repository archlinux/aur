# Maintainer: Nicholas Ivkovic <nivkovic@tuta.io>

pkgname='tspreed'
pkgver=2.0.1
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('353de4d4e1c3e5b8d7dd2cea6bc6aef8f7687ab49a36a3a540e0bf7d3775f9fc')

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
