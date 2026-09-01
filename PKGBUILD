# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly.en
_pkgver=0.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Language Support for 'sylly' Package: English"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-sylly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4182c76fbfedd679e2ab3b5dc043f582')
b2sums=('0f709946b1b9518a4d71ab148aa1d078891af858be18b32e9ef9af8ae1c1b9fc7cd3550b94236fa7b25aa921d1f78a4ac03d54d8d48f5bd0dcbc5e083a947e62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
