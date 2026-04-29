# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpNet
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Programming Model for Network Inference"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-kegggraph
  r-lpsolve
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0df5420893c41402ec99789f6edaec0c')
b2sums=('003c3d3d462b02a50530c6eec1c2ea3dd4804c3d0c803aa23acad1b5c791ab713032fff1dc24850575dec94669bb72bdd7b6f0eafb186fc7b0c26d6fd40876c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
