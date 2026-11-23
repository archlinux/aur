# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=drat
_pkgver=0.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'Drat' R Archive Template"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-git2r
  r-simplermarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('76f35412953cc74e81e4279821860bde')
b2sums=('441494f6f3d506c5146f501bfd4ab16b0fc0369a81aab62919f0bf1b07b3909b80bdc086e33b3087d29f12d526e8be17d3b393cc604077321112a669a04626be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
