# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSA
_pkgver=1.03.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Gene Set Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-impute
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('287111ee3bb2bbe301651cfac69f9c1b')
b2sums=('fac269fab725e80b7ae38e9c91149e5e5910f830690cc26149bb4dab734413feba02aec165abe78f843c6933c8f445d7c5a99107f9659449096313a2f5fb6d1b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
