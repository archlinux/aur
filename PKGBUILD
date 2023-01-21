# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.80.3
pkgname=r-${_pkgname,,}
pkgver=1.80.3
pkgrel=1
pkgdesc='genefilter: methods for filtering genes from high-throughput experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-all
  r-biocstyle
  r-class
  r-hgu95av2.db
  r-knitr
  r-rcolorbrewer
  r-roc
  r-tkwidgets
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09995bc8d29311f1083c3f27abbff2e055778666dd9d1941031563d73141f710')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
