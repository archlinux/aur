# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cardinal
_pkgver=3.6.4
pkgname=r-${_pkgname,,}
pkgver=3.6.4
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
  r-cardinalio
  r-ebimage
  r-irlba
  r-magrittr
  r-matter
  r-mclust
  r-protgenerics
  r-s4vectors
  r-signal
  r-viridislite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82e8a949b9ef7a8e89d4395913820c3f3e136712bf4654ad90ab3e8068d79bf4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
