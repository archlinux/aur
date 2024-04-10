# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lsa
_pkgver=0.73.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Latent Semantic Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-snowballc
)
optdepends=(
  r-tm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('205b9add99f5a37f1cf93567ec73c5e0')
b2sums=('3ee2effb3494a786fe8fafc10f609b449f4dfd277eb303eab2d31bbc33745ac5bd95f086d557391403486ecfa8e2bd80cc956cc3dd192c0b0dbb39010b509bd2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
