# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fracdiff
_pkgver=1.5-1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
pkgrel=4
pkgdesc='Fractionally Differenced ARIMA aka ARFIMA(P,d,q) Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-forecast
  r-longmemo
  r-urca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8103b32a4ca3a59dda1624c07da08ecd144c7a91a747d1f4663e99421950eb6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
