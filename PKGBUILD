# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LOBSTAHS
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=1.33.0
pkgrel=1
pkgdesc='Lipid and Oxylipin Biomarker Screening through Adduct Hierarchy Sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-camera
  r-xcms
)
optdepends=(
  r-knitr
  r-pth2o2lipids
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('063235f3e5bf7c9499330c6cff7852e03e39f00f36bc87a0e308c1c9e7540272')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
