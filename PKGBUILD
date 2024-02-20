# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=circlize
_pkgver=0.4.16
pkgname=r-${_pkgname,,}
pkgver=0.4.16
pkgrel=1
pkgdesc='Circular Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-colorspace
  r-globaloptions
  r-shape
)
optdepends=(
  r-bezier
  r-complexheatmap
  r-covr
  r-dendextend
  r-gridbase
  r-knitr
  r-markdown
  r-png
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16dc32c7704906d13a9e5281bb396e92fb89a6b17fa5e201953240726b650b67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
