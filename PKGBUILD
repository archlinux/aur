# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=readJDX
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Import Data in the JCAMP-DX Format'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-stringr
)
optdepends=(
  r-bookdown
  r-knitr
  r-mvbutils
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('445be2594faaba3abb1d5018107aa8a6a9a9fcbcf0eada0b36cdbce7943c5ca5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
