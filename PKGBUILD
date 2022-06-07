# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mQTL
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=5
pkgdesc='Metabolomic Quantitative Trait Locus Mapping'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-outliers
  r-qtl
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('21193861fbf2d280f2b7284ba87d68adce515e35fbe4e71821439fa8b14d1b72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
