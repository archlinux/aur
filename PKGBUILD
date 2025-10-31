# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HELP
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for HELP data analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b535df2e5b7788524fb47eaad43da1f8')
b2sums=('adcb64e3472bc9823b5e01b217ec86b70e7a00f3cdbbd7f78feec49c5ba40a7e0e445c6a2d2feb5956d5bcd5ed576294af6a769fecb9bbb5b92b3848032471f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
