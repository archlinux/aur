# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBGL
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An interface to the BOOST graph library"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rgraphviz
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('73342b8cffe74267307e7c2e0a7ecc1c')
b2sums=('a6f33df88a364020f9e2a761798ddb3228421323a6ee35e08e85a631be86f16b0f9d24433429619204b23e97614c05c1a548e50be77ea62ddd6f6a14cfd45514')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
