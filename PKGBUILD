# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sva
_pkgver=3.44.0
pkgname=r-${_pkgname,,}
pkgver=3.44.0
pkgrel=1
pkgdesc='Surrogate Variable Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-edger
  r-genefilter
  r-limma
  r-matrixstats
)
optdepends=(
  r-biocstyle
  r-bladderbatch
  r-pamr
  r-testthat
  r-zebrafishrnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('441d2096740bd7acceedd5704b104c077adf0226821f49b584405160732a424d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
