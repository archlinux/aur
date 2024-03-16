# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=laeken
_pkgver=0.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Estimation of Indicators on Social Exclusion and Poverty"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53ce6fcbfb5e1ba2ecaafa353665bbaf')
b2sums=('d8b798c7da92b82a507e640ae3a0c80d71f3ed4a7514f0a25845045dccad406724fa52dea82ad340b95e90be016acd42522306bdddd32258e07bb35b0231d636')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
