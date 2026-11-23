# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Spectra
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=1.22.2
pkgrel=1
pkgdesc='Spectra Infrastructure for Mass Spectrometry Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-data.table
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
  r-msdatahub
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
sha256sums=('2a95538dc4fb4b03fd2d6f2db23ea2c9599d9883a1f8021e89f26f94ff10fe7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
