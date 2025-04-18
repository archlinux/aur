# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEIGOR
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MEtaheuristics for bIoinformatics Global Optimization"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cnorode
  r-desolve
  r-rsolnp
  r-snowfall
)
optdepends=(
  r-biocstyle
  r-cellnoptr
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2959cccd65cccb9cad0f030a0c6770ce')
b2sums=('93a8da05de6a5ed04275113154b4d2a51f6e6c93c13f01930ccc30793486d4e83a9102c6c2af06f46ba3a3d94dc56509868757cb7d7f4956ae5c629e941dfcd3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
