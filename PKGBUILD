# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scde
_pkgver=2.28.2
pkgname=r-${_pkgname,,}
pkgver=2.28.2
pkgrel=1
pkgdesc='Single Cell Differential Expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-cairo
  r-edger
  r-extremes
  r-flexmix
  r-pcamethods
  r-quantreg
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-rjson
  r-rmtstat
  r-rook
)
optdepends=(
  r-cba
  r-fastcluster
  r-go.db
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed44feaf2133b164dd0b4f8448e217835c9f8aa1e6166eb51d2bb37b9940d5e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
