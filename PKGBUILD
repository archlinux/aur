# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Spectra
_pkgver=1.13.8
pkgname=r-${_pkgname,,}
pkgver=1.13.8
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
  r-metabocoreutils
  r-mscoreutils
  r-protgenerics
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-msentropy
  r-mzr
  r-patrick
  r-rhdf5
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e87bd3c752a00cad070b3893e69c3e576b0e526a35b87f978148dbc65ec294e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
