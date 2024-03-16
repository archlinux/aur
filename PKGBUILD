# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=english
_pkgver=1.2-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Translate Integers into English"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1215268b9fabf76a6e2c7c150af7e6d8')
b2sums=('0043a499f07c79ae1783a51fddb72c23b3d553c5da7df93ee5c1d8083e08cb41ae67fb7e85607d3333debee67c97cdaefce88139a7f390aa7c8a7236177d00f5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
