# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVAdata
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=1.33.0
pkgrel=1
pkgdesc='Data employed in the vignette of the GSVA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-gseabase
  r-hgu95a.db
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6753804f9f2ac3bd9702be2af24f84acba2ac06db46b78493d42fc1299287e44')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
