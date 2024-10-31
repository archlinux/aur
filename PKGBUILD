# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mogsa
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Multiple omics data integrative clustering and gene set analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-corpcor
  r-genefilter
  r-gplots
  r-graphite
  r-gseabase
  r-svd
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5ca2a5595b33cd9c9db7b8e76c1948997c5d799d4c1288028c53ee577407348c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
