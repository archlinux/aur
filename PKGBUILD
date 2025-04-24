# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixsmsn
_pkgver=1.1-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fitting Finite Mixture of Scale Mixture of Skew-Normal Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0340c94b1f7a3756bc1b896e7aa5b8f1')
b2sums=('4a72de0071de498a76567b78149f3cd2efd82bb074400762a39202095d96b2ba9eceedb8959fd946912fa4457b7bb4f83e3e9e5d99678064f4bd5b22bc556926')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
