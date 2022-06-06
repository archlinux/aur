# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcoexp
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Differential Co-expression Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-diffcorr
  r-igraph
  r-psych
  r-summarizedexperiment
  r-wgcna
)
optdepends=(
  r-geoquery
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aec9693fb1fd79eaa5a5759d335e3bb0dc6934019c458cb4b74983bc57e82f51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
