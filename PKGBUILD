# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcxnData
_pkgver=2.23.0
pkgname=r-${_pkgname,,}
pkgver=2.23.0
pkgrel=1
pkgdesc='Correlation coefficients and p values between pre-defined pathway/gene sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-pcxn
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07a9b42ea4476cc75a56564db2978b47bd0b389fde7224739ff2972ef359383a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
