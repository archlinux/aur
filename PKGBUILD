# Maintainer: Nicholas Ivkovic <https://nivkovic.net>

pkgname='tspreed'
pkgver=2.6.2
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4079c4c5190ec036e897ac686916b34bf27dbd1ef6627b087ef57efb50f38cfa')

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
