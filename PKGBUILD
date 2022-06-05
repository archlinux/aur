# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws.signature
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=4
pkgdesc='Amazon Web Services Request Signatures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-digest
)
optdepends=(
  r-aws.ec2metadata
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7fe4f686979be21e5a8ba7ae11f0fade4f5aaf4e98063b5349ee0962dbb9496')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
