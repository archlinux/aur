# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ibh
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interaction Based Homogeneity for Evaluating Gene Lists"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-simpintlists
)
optdepends=(
  r-yeastcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c028c9f17de8180f8724f8e3b252911d')
b2sums=('7bf1c3e740edd9532ab454d8396aabdec518756b42eff9a5c5f96ef99baaf9711a7d2d9b668017f7e157f80f2e157c1773e73a3e95e3bc0dd09387208cb16615')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
