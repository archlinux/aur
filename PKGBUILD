# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Automated Affymetrix Array Analysis Umbrella Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-a4base
  r-a4classif
  r-a4core
  r-a4preproc
  r-a4reporting
)
optdepends=(
  r-all
  r-cairo
  r-gostats
  r-mlp
  r-nlcv
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b86a1019a7c46fe4bf085249f9191730aeadc13e86bef4deac2fa9e39243aea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
