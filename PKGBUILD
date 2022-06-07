# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ABAData
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=4
pkgdesc='Averaged gene expression in human brain regions from Allen Brain Atlas'
arch=('any')
url="https://bioconductor.org/packages/3.14/data/experiment/html/ABAData.html"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-abaenrichment
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/3.14/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9cf68f990d227fbff72dfc58b497a1553e64b1cb9c7617a3352ee150f8ef6f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
