# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGG.db
_pkgver=3.2.4
pkgname=r-${_pkgname,,}
pkgver=3.2.4
pkgrel=7
pkgdesc='A set of annotation maps for KEGG'
arch=('any')
url="https://bioconductor.org/packages/3.11/data/annotation/html/${_pkgname}.html"
license=('custom')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/3.11/data/annotation/src/contrib/KEGG.db_${pkgver}.tar.gz")
sha256sums=('2e60d1b664cbd1491cc00ed13a22904706c5a4651150f70daca04bf3ba9ead88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
