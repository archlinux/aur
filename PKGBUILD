# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttservice
_pkgver=0.3.8
pkgname=r-${_pkgname,,}
pkgver=0.3.8
pkgrel=1
pkgdesc='A Service for Tidy Transcriptomics Software Suite'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
)
optdepends=(
  r-methods
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('24d5f9c5da9bd85cfdc9c5dbe900ea787a9a552d836e3e98096d0209b7c973be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
