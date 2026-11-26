# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBGL
_pkgver=1.90.0
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
md5sums=('9b3a49cb32958d7bb81ccff80ea73b7e')
b2sums=('783a39e3e16e0c8c42482678f37aa32946faba848536c59876f6238454f14cdc8e2588dffa49af67517b8edeae9e94399dd5a789079bc1e64c2ea1b69864812b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
