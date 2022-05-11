# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname=('percolator' 'percolator-converters')
pkgver=3.06
pkgrel=1
epoch=
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
arch=('x86_64')
url="http://percolator.ms/"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://github.com/percolator/percolator/releases/download/rel-${pkgver/./-}/percolator-v${pkgver/./-}-linux-amd64.deb"
    "https://github.com/percolator/percolator/releases/download/rel-${pkgver/./-}/percolator-converters-v${pkgver/./-}-linux-amd64.deb")
md5sums=('eef1432b0c01e0ac997ec117cabd8d4e'
         '3bf508d9e6a461266583905df694b099')
package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	provides=("${pkgname[0]}")
	conflicts=("${pkgname[0]}")
	ar x "${srcdir}/${pkgname[0]}-v${pkgver/./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir" --exclude usr/bin/gtest_unit
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	provides=("${pkgname[1]}")
	conflicts=("${pkgname[1]}")
	ar x "${srcdir}/${pkgname[1]}-v${pkgver/./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

