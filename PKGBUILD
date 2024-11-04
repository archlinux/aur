# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=changepoint
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Changepoint Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-zoo
)
optdepends=(
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00e6f52b86eda945cd80bd1ba28638a0')
b2sums=('b085d32b3b649f603f850cad46fdd76632495b46381f47c774d2f663fa52f602f80ad1f7f93d91b507199c31a0df658e623dd88d0c8a3652e3be8c6377d4837a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
