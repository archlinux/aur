# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqmagick
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=4
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
sha256sums=('6facd51e9b7bb68c1b59e61c6fea07a6042d26d78f81eda4ba754c84ba6e3b40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
