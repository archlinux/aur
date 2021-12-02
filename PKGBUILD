# Maintainer: Nicholas Ivkovic <https://nivkovic.net>

pkgname='tspreed'
pkgver=2.2.0
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1f62bc7d803a5395036cfe7108aeb58879fdff00097a675b909e3f7dbb7ee725')

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
