# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tsne
_pkgver=0.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="T-Distributed Stochastic Neighbor Embedding for R (t-SNE)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('987353259ec738b8b64ccbd9a31a3b22')
b2sums=('d1463f1910fb7072b9bdd98fbe51384414af1302036e1143aef92e283330e0ad7a45f81c7c89ff978f02c9350faaf977ceaf09ba77218a85621ed3ba83698f15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
