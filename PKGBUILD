# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trio
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=3.38.0
pkgrel=1
pkgdesc='Testing of SNPs and SNP Interactions in Case-Parent Trio Studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-logicreg
  r-siggenes
)
optdepends=(
  r-haplo.stats
  r-kernsmooth
  r-logicfs
  r-mcbiopi
  r-splines
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f58fcd0c9d087d1a183310a42c4c0f9d0ed2160f444852b6e1b73c22e6ffacb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
