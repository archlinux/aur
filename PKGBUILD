# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase=('percolator-bin')
pkgname=('percolator' 'percolator-converters' 'elude')
pkgver=2.10
pkgrel=1
epoch=
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
arch=('x86_64')
url="http://per-colator.com/"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://github.com/percolator/percolator/releases/download/rel-${pkgver/./-}/ubuntu64.tar.gz")
md5sums=('ff9ec3b71587958697909d6954098700')
package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	ar x "${srcdir}/percolator-v${pkgver/./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	ar x "${srcdir}/percolator-converters-v${pkgver/./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_elude() {
	pkgdesc="Software package for prediction of retention times in mass spectorometry experiments."
	ar x "${srcdir}/elude-v${pkgver/./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}
