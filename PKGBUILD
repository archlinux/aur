# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixsmsn
_pkgver=1.1-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Fitting Finite Mixture of Scale Mixture of Skew-Normal Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbb96b987d5d2ed7e379a4d25d698dc0')
b2sums=('4e283e69448442649b20383f88285fb02e6ef9e94df9abb5b875d48ee460b4d33b3144442051537edfbf826cda354577ac21ced5248cdf5e9039b5703c142075')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
