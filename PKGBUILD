# Maintainer: Cem Keylan <cem at ckyln dot com>

pkgname=bm-git
_pkgname=bm
pkgrel=2
pkgver=0.3
pkgdesc="command-line bibliography manager for biblatex"
url="https://git.ckyln.com/bm/log.html"
arch=('any')
license=('GPL3')
depends=('jq')
optdepends=('poppler: for getting DOI metadata from a pdf')
makedepends=('git')
source=("git://git.ckyln.com/${_pkgname}")
md5sums=('SKIP')

provides=('bm')
conflicts=('bm')

pkgver() {
	cd ${_pkgname}
	git describe --tags | sed 's/-/./g'
}

package() {
	cd ${_pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
