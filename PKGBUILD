# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=brglm
_pkgver=0.7.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Bias Reduction in Binomial-Response Generalized Linear Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-profilemodel
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce9f9e9381b460f9e170ddd1370776cb')
b2sums=('d3e0230c64da354c106b32f0d0fbee0b214e7c2ea2a6d6a083e8759d3fcfa910b9aa6f5e20a1695cf9f425ce14cde07b8808940f7072550d6d15d763054f83c9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
