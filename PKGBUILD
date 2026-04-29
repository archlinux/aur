# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustComp
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering Comparison Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sm
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-colonca
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('535e89cf7455e8bea39239642dd30002')
b2sums=('454a0218cb86ac7d24a783d00aa2d91deae42484196ff30a75bfe83bdbb5067754c8b06c3a72452d816e9557e1e02e5d6f59583c3b74094e775fa00fe81ef0b6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
