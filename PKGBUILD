# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=2.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Regression Models with Break-Points / Change-Points Estimation (with Possibly Random Effects)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4dc76a641455476fb92dcd1c9fa78c64')
b2sums=('708a9b31c46b9bd38522215674172bcbfdcf63e011c30a56dd5c430ba27a1eb35e92a463bb5eed84854b15df80fdd18ea3ccd9503f09e8be19527b751ea49922')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
