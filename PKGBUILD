# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=systemPipeRdata
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='systemPipeRdata: Workflow templates and sample data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-jsonlite
  r-remotes
)
optdepends=(
  r-biocstyle
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
  r-shortread
  r-systempiper
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d86fe3aa6982ec65643f040733c93dd7e950a90feb7a2c470e5d4c78a26378c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
