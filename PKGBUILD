# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsmoothr
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Smoothing tools"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d90da237ee71eb665b8d59f210c5b6ee')
b2sums=('a7b049971344680fae97daffb8c3f19de51871fc5dd8de640103b5706e6956494503b60b3ec2b78ef132b09c68342889cd1d16dcc31573d42fb2e5bbf16efda2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
