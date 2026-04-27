# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lhs
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latin Hypercube Samples"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcpp
)
optdepends=(
  r-doe.base
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('70018dd2a1ea2c8070048efe07ea3583')
b2sums=('db3661699269b626779caba6bfc4fbe4487712fb7c40e72538cb1769f65a0e052e74e245c986f45094b48b97ca1fbc9efc4001db429ff80b3296a26d6b62f7e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
