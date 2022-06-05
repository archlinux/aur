# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws.s3
_pkgver=0.3.21
pkgname=r-${_pkgname,,}
pkgver=0.3.21
pkgrel=4
pkgdesc="'AWS S3' Client Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-aws.signature
  r-base64enc
  r-curl
  r-digest
  r-httr
  r-xml2
)
optdepends=(
  r-datasets
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd21054ab63555d294e7465dcb6c86f107db52ba841aeac5bdf4d00af0674c8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
