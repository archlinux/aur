# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dupRadar
_pkgver=1.30.3
pkgname=r-${_pkgname,,}
pkgver=1.30.3
pkgrel=1
pkgdesc='Assessment of duplication rates in RNA-Seq datasets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rsubread
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e51970df637b5e67f47f7d4aa7a1a532a8d5302961e5daf1ed198da79b734816')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
