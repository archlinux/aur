# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AffiXcan
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='A Functional Approach To Impute Genetically Regulated Expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-crayon
  r-multiassayexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d5c66315922d9b00da35198f3b47de22c5954d7bda909624b569eb24456304a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
