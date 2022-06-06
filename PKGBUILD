# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survtype
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Subtype Identification with Survival Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-clustvarsel
  r-pheatmap
  r-summarizedexperiment
  r-survminer
)
optdepends=(
  r-knitr
  r-maftools
  r-rmarkdown
  r-scales
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6512aa97ab047c202ab404c1db6ae55be60cdaaf68defd2e5e930b99b4141846')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
