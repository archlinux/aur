# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqmagick
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=1
pkgdesc='Sequence Manipulation Utilities'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-magrittr
)
optdepends=(
  r-downloader
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-knitr
  r-muscle
  r-prettydoc
  r-rmarkdown
  r-rsamtools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f872c7b3f39e5b21a5820478102e0b39ecf5d7e2a12dfba263568ab250ab1f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
