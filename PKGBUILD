# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefu
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='Computation of Gene Expression-Based Signatures in Breast Cancer'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aims
  r-amap
  r-biomart
  r-ic10
  r-impute
  r-limma
  r-mclust
  r-survcomp
)
optdepends=(
  r-biobase
  r-biocstyle
  r-breastcancermainz
  r-breastcancernki
  r-breastcancertransbig
  r-breastcancerunt
  r-breastcancerupp
  r-breastcancervdx
  r-caret
  r-genemeta
  r-knitr
  r-magick
  r-rmarkdown
  r-rmeta
  r-survival
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b44b694308e41392bfd828953089e38e0b5f561bd52fb949c82e537a6a7bd33')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
