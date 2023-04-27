# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cardinal
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=3.2.0
pkgrel=1
pkgdesc='A mass spectrometry imaging toolbox for statistical analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-ebimage
  r-irlba
  r-magrittr
  r-matter
  r-mclust
  r-protgenerics
  r-s4vectors
  r-signal
  r-sp
  r-viridislite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f18b86cafeb6463403dac6dd11ec66b8a17e3849b5186126e1f12339ca542d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
