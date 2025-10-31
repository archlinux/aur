# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBGL
_pkgver=1.86.0
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
md5sums=('b9fdd333b124e0e5cd6c344269e1c6a1')
b2sums=('69780b95f4cfb9af6a5a2da9b78c386ece5fd84b6c2f44be651570d1b482b16e220559a144f4c343835649c44c7123e72e8dab85500e873e79eb1a6167fba88f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
