# Maintainer: Cem Keylan <cem@ckyln.com>

pkgname=bm
_pkgname=bm
pkgrel=2
pkgver=0.4
pkgdesc="command-line bibliography manager for biblatex"
url="https://git.ckyln.com/bm/log.html"
arch=('any')
license=('GPL3')
depends=('jq')
optdepends=('poppler: for getting DOI metadata from a pdf')
source=("https://git.ckyln.com/archives/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f21c2b7590385f9158c5666dbcfd2c78')
provides=('bm')
conflicts=('bm')

package() {
	cd $srcdir/${pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
