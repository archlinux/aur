# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LPEadj
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='A correction of the local pooled error (LPE) method to replace the asymptotic variance adjustment with an unbiased adjustment based on sample size.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6010fb7339e19e0cd06f773103471c2ff709e7810503af8e467a31e0ce5c6370')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
