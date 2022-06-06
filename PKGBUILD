# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicTools.fileHandler
_pkgver=0.1.5.9
pkgname=r-${_pkgname,,}
pkgver=0.1.5.9
pkgrel=4
pkgdesc='File Handlers for Genomic Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-snpstats
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c1991cc85eddddc7b2a14c1d861bc84956061407de4031b4b442e741c3f8826')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
