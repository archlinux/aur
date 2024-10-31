# system requirements: pyGenomeTracks (prefered to useinstall_pyGenomeTracks())
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGenomeTracks
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Integerated visualization of epigenomic data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-imager
  r-reticulate
  r-rgenometracksdata
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f62bf2f05fd5db5c4c51c0f95f11da6fae9ff10de208b2dfe258ba9f4a59f139')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
