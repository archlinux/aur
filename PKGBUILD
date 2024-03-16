# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aod
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of Overdispersed Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1be0359bcffcbec8fa4bbbd78e4df84a')
b2sums=('1ad33578d85bfed5402fa117a38e69e9da8e12436a241247b22f0f16daa0a65586fd2f9881f1bc780bd0ab3ed59140ae9114a392834d5ddafb77a591fcb83d0d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
