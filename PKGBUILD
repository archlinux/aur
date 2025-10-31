# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pgca
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Algorithm to Link Protein Groups Created from MS/MS Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4464dffa04b3dc70617c800d03267d08')
b2sums=('d35b103f35f14e62c485343d51ff52417cdf93725836d2947765eeb3c8f2e3bbe8dabb40bf8f645c287bed4f0822baecf91a803866d35bde72e68cdce1816fc6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
