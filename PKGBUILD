# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.34.1
pkgname=r-${_pkgname,,}
pkgver=1.34.1
pkgrel=1
pkgdesc='Bioconductor-specific package checks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-biocviews
  r-graph
  r-httr
  r-knitr
  r-optparse
  r-stringdist
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-biocstyle
  r-codetoolsbioc
  r-devtools
  r-rjsonio
  r-rmarkdown
  r-runit
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8fd4306d7d762c6246d153442fff583d650e0564a3aa3d654ff71c28d34245f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
