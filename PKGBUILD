# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Rn.eg.db
_pkgver=3.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Rat"
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
md5sums=('12e5314b50c5eff0df84a98f775f2f03')
b2sums=('2bba8bc6bbbb4b2110faa9087023c5ee8877d1e4bec701f7f3dae083a10993ebfaf076b17030769c55d257a0eaaae8df9754ee0fef8ed5505015b9650f747596')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
