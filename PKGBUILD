# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cba
_pkgver=0.2-25
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering for Business Analytics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-proxy
)
optdepends=(
  r-colorspace
  r-gclus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('827c0fd7155bf248f960d4a59706a16e')
b2sums=('2720d6575c09f1b547d443fce8da25af52a845514c97a3267f82d191c9df1fbfcdaf0ae5f774a4ae67feb36181874d3178aae83d65637e06647aeb99837c188b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
