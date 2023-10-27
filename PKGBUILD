# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recount3
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Explore and download data from the recount3 project'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-data.table
  r-genomicranges
  r-httr
  r-r.utils
  r-rtracklayer
  r-s4vectors
  r-sessioninfo
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-interactivedisplaybase
  r-knitcitations
  r-knitr
  r-pryr
  r-recount
  r-refmanager
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5446e733740000ff9917744d53a731f4bb12f4b802c2ede788f9f1930295c47e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
