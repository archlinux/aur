# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nor1mix
_pkgver=1.3-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Normal aka Gaussian 1-d Mixture Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-copula
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d12069ed00dd01177f8a41749e4cce6')
b2sums=('2c8eb05111bd581882fd46a58ba5de4934d70e64959596c7ac1509da9462a87347a90029cdb622e57bdb4cb72a9e40e760226a412120cb712b49d99abe564c63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
