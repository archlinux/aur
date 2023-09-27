# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Spectra
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=1.10.3
pkgrel=1
pkgdesc='Spectra Infrastructure for Mass Spectrometry Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-fs
  r-iranges
  r-mscoreutils
  r-protgenerics
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-mzr
  r-rhdf5
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1bb9ac29792a5ecfc2fa7188c90c895e426059c85b96ff179a2ebb24e8eca6bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
