# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROSeq
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('0e3d153c6dfc46b6f883f7ef0cf978b3a4210090cca8b4358c801d5f443d5d26')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
