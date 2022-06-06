# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=systemPipeRdata
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=2.0.1
pkgrel=1
pkgdesc='systemPipeRdata: Workflow templates and sample data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-jsonlite
  r-remotes
  r-rsamtools
  r-rtracklayer
  r-shortread
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-systempiper
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('70b28d7700ab3790b93ef1674979aaad11187fd823b437853cb1893e6120a6bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
