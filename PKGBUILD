# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Bt.eg.db
_pkgver=3.24.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Bovine"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7ccd7df8b4594447a4e19aa673ba1d2')
b2sums=('29e815b54236ed439dd34a90b3a24ec4558c702c073d97c4fabf57c289788bbe0c01e692768efc2632de04ca9e50b75ec4acaf7b0db527538f958ad5e8b4f61a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
