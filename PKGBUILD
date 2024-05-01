# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROSeq
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Modeling expression ranks for noise-tolerant differential expression analysis of scRNA-Seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-edger
  r-limma
  r-pbmcapply
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cccd6ffab102bc9d80aae8e099d522a8b53fe29eb349e5e5b67f9daa9f6b43e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
