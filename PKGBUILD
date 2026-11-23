# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVAdata
_pkgver=1.48.1
pkgname=r-${_pkgname,,}
pkgver=1.48.1
pkgrel=1
pkgdesc='Data employed in the vignette of the GSVA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-gseabase
  r-spatialexperiment
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b0a6068c5b139c61c27c64f50d798af47e02ecaa88f2f8b38267f9726ab3f1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
