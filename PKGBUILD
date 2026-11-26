# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SANTA
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=2.50.0
pkgrel=1
pkgdesc='Spatial Analysis of Network Associations'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-biocgenerics
  r-bionet
  r-dlbcl
  r-formatr
  r-knitr
  r-markdown
  r-msm
  r-org.sc.sgd.db
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32982b264245b18aee05659b3b04d1457d35aeb27d4e2311c9c8e5b8e4169f12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
