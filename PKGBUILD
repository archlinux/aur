# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calm
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Covariate Assisted Large-scale Multiple testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99f176be691a69403f3a5ac1706a66c1')
b2sums=('a2a953d757255f6cfabf637f61dcc69dc42737cce934b7a8b4907676ba329786e4bdd909fbe872877fc05c0abe805f5c6dda0b04c3103eb89656be75053cb3a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
