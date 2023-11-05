# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VAM
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=1
pkgdesc='Variance-Adjusted Mahalanobis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-sctransform
  r-seurat
  r-seuratobject
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('703649a81d2691179bf1dc03c395d0740b721c4d16dd528d67441039ee9f84da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
