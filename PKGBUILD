# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-yulab.utils
)
optdepends=(
  r-ggtree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ccc36bb19f64c440947176ba44dd95fe')
b2sums=('adfb7ea07fe2b945ccf1e6c1ba4d81ce96734e4beea62bddc4b6c611879ffae2df5ebd0ebf65e99d398da944c1cd6f9dfdb6a2b57274197ae059e266b067b549')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
