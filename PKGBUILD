# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Icens
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NPMLE for Censored and Truncated Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('265fcc9fa33b10fad738bcaea0e0dd4d')
b2sums=('b4a90b3009e1571f74a5effc433d01cceae87af86207df5662956d2627969f507de27eae1137e48dcd261199321f49751ca8e3a64a661cd9d108885252fc8a22')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
