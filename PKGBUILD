# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Decorate a 'ggplot' with Associated Information"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggfun
  r-ggplot2
  r-ggplotify
  r-magrittr
  r-patchwork
)
optdepends=(
  r-ggtree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d71398cd2be0c5e51a46616471716348')
b2sums=('d6ceae132ce6f04a32acb80f3c23e4028c9ab0bcafc36828a0c9dd6e07fa866c5b4cc83db382ce041d7745e580f4dfd9aad3b6af81f03ce38324e023dd9daab4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
