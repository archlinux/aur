# system requirements: GNU make, Bash, Perl, Gzip
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netboost
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Network Analysis Supported by Boosting'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  bash
  gzip
  make
  perl
  r
  r-biocstyle
  r-colorspace
  r-dynamictreecut
  r-impute
  r-r.utils
  r-rcpp
  r-rcppparallel
  r-wgcna
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e6b4e80f95cc944083469eb710eb45a6582f0391f62e3d8e813d63f8b33b4974')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
