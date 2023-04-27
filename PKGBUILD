# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rnaseqcomp
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Benchmarks for RNA-seq Quantification Pipelines'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e39323c6c9654b4b4d39386677bf3ffacf8abe5e29050f7c9e604c5dc3abce78')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
