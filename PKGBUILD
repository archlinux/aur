# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.10.1
pkgname=r-${_pkgname,,}
pkgver=2.10.1
pkgrel=1
pkgdesc='STRINGdb (Search Tool for the Retrieval of Interacting proteins database)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gplots
  r-hash
  r-igraph
  r-plotrix
  r-plyr
  r-png
  r-rcolorbrewer
  r-rcurl
  r-sqldf
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9552ceae36676acf03af841fe56393ea38991ad6d717b2e5219422c71cd2fa62')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
