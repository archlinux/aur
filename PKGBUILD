# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easyPubMed
_pkgver=2.13
pkgname=r-${_pkgname,,}
pkgver=2.13
pkgrel=4
pkgdesc='Search and Retrieve Scientific Publication Records from PubMed'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad94b76d7386594c1bd6fb008a7c2ee708d49712575632eef36f9e8f7d8ba8f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
