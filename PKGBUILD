# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=base64
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=2.0
pkgrel=4
pkgdesc='Base64 Encoder and Decoder'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-openssl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e259c2b12446197d1152b83a81bab84ccb5a5b77021a9b5645dd4c63c804bd1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
