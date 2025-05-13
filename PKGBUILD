# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yamss
_pkgver=1.34.1
pkgname=r-${_pkgname,,}
pkgver=1.34.1
pkgrel=1
pkgdesc='Tools for high-throughput metabolomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-ebimage
  r-iranges
  r-limma
  r-mzr
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-mtbls2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c48713c8a9b31e4112a62bee6cc64db65f93968dabd910ee83ee3167bc3e22a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
