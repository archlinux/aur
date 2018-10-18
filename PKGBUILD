# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname=('percolator' 'percolator-converters' 'elude')
pkgver=3.02.01
pkgrel=1
epoch=
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
arch=('x86_64')
url="http://percolator.ms/"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/ubuntu64.tar.gz")
md5sums=('9c2ff277ae053b3978e198f953baef95')
package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	provides=("${pkgname[0]}")
	conflicts=("${pkgname[0]}")
	ar x "${srcdir}/${pkgname[0]}-v3-02-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	provides=("${pkgname[1]}")
	conflicts=("${pkgname[1]}")
	ar x "${srcdir}/${pkgname[1]}-v3-02-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_elude() {
	pkgdesc="Software package for prediction of retention times in mass spectorometry experiments."
	provides=("${pkgname[2]}")
	conflicts=("${pkgname[2]}")
	ar x "${srcdir}/${pkgname[2]}-v3-02-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}
