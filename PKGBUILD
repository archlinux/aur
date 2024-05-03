# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recount3
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('a049bb230721431fb5e6aa05ad6c2dfe3d5b7e99f15d7c0556ac245e8b2eacb6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
