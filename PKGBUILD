# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws.signature
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=0.6.2
pkgrel=1
pkgdesc='Amazon Web Services Request Signatures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-curl
  r-digest
  r-jsonlite
)
optdepends=(
  r-aws.ec2metadata
  r-devtools
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7df95b77cd51f9bc37181ff6c76e02d371e88be51971c2d5a47b2f99293c2cad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
