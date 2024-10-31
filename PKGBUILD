# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASAFE
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ancestry Specific Allele Frequency Estimation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0b5ce85ed013abf23384cc62c077325')
b2sums=('b77cadea92b2f71a9aaf955c5e0f0278960dd6ea2a11fc4c4da588b2b430b1273ab66868435b8f9c337f9a892b8d244778a49a2f6d30ea75b1beaccd02033aa1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
