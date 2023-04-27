# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recount3
_pkgver=1.9.1
pkgname=r-${_pkgname,,}
pkgver=1.9.1
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
  r-r.utils
  r-rcurl
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
sha256sums=('0214197f87982f1a68909debb3c5d936d25d786eb62ec2606b436af653663599')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
