# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVSeq
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Remove Unwanted Variation from RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-edaseq
  r-edger
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-knitr
  r-rcolorbrewer
  r-zebrafishrnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22e9800d5bbff0b0a3846c0bd23ca97e5802adb7cf4b85724cb07c35ef47eeac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
