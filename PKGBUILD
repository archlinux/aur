# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iasva
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Iteratively Adjusted Surrogate Variable Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-irlba
  r-summarizedexperiment
)
optdepends=(
  r-corrplot
  r-desctools
  r-knitr
  r-pheatmap
  r-rcolorbrewer
  r-rmarkdown
  r-rtsne
  r-sva
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e848c49361451a5ae5eb66d6571aca0a1d6b3535e30394d793490e85c2ae192')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
