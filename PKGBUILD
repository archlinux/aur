# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.3.1
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
  r-ggtree
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99bf048631e9f54cbc2b82c8da4a96e9')
b2sums=('b42bb67affc1307aa7c16792eb1e872823bc13e97e968ef9776d9311579a6d0c5475c2ec2e5a04c07869d9de89af8af76a42b7a43730060e59913cb257d948ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
