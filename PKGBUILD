# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vipor
_pkgver=0.4.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Plot Categorical Data Using Quasirandom Noise and Density Estimates"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-beanplot
  r-beeswarm
  r-ggbeeswarm
  r-ggplot2
  r-testthat
  r-vioplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b61141e983b4026e67efb5d616e33ff')
b2sums=('e6e6ec2ecf9724a99307ff893c23de1859346f23a4b8e1736e9cefb8323fcec776a92b7dd65b94bbad8dffb588985b2002e90dc4c0c77965080269add8c06037')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
