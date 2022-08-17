# system requirements: GNU make, Bash, Perl, Gzip
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netboost
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=2.4.1
pkgrel=2
pkgdesc='Network Analysis Supported by Boosting'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-dynamictreecut
  r-impute
  r-r.utils
  r-rcpp
  r-rcppparallel
  r-wgcna
  make
  bash
  perl
  gzip
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('676eb72a09286ce8eab2b97df3ed6f68ba3e771c7c707da71353fb12eef62a87')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
