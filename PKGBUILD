# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=brglm
_pkgver=0.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bias Reduction in Binomial-Response Generalized Linear Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-profilemodel
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('947dc2e2c8e59b69518e73219faf7031')
b2sums=('cf3a1362c3329c81bc614e1a15ab729937b0f851cd529e55ea3e4a00549ef6fdcc82cc4b1e619c00df22be76afbf4fc01b8165ec2f3707f9aca9ca01341aa733')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
