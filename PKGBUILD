# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.80.2
pkgname=r-${_pkgname,,}
pkgver=1.80.2
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
sha256sums=('988d630d607713491ecda184597dfab9e0dbb57c770049c2ae71e68a21f84538')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
