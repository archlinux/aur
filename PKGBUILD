# Maintainer: Nicholas Ivkovic <https://nivkovic.net>

pkgname='tspreed'
pkgver=2.4.0
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73acfbd74dcd89ba1c38aec486d579b636d3c7ce962d524944333503e2822a14')

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
