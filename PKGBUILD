# Maintainer: Nicholas Ivkovic <https://nivkovic.net>

pkgname='tspreed'
pkgver=2.6.1
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('04b408a670c790c2f38d0c0ff23ae88afd714b6684f626fecebd99eb82725d2c')

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
