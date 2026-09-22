# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.3.2
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
  r-gtable
  r-magrittr
  r-patchwork
  r-pillar
  r-yulab.utils
)
optdepends=(
  r-cowplot
  r-ggtree
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('39aff02633725cab3b1039de7ebd7f3a')
b2sums=('ffd14a89df354d17f3009cd517ddd1db580ab4a625c1ab6db7dfbd03f35901e6100cc06961df7d4ba7296631396eac3f9877d8b723ffdc2af912ecd136cb8214')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
