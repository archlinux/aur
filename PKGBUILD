# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiOmicsViz
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Plot the effect of one omics data on other omics data along the chromosome"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-doparallel
  r-foreach
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a051b5e32c72385f4463cbe1751c1484')
b2sums=('640ba46dbe596ee7d58ea4be34fa5a08408c0f369d0830429b70416909873dcffe39d25b08c38745e4816562aca4b7eee6f991db536c724a6acfbf98d1f76161')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
