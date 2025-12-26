# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFAM.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of protein ID mappings for PFAM"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('401389a46383ca2ee9318356fce09621')
b2sums=('43f8b92a16fbcf8aa02130598a36cf696bb6bc42065649f542f157d937bb3a851df2d5a3825898c7fa364ed052dc9c9057cffcc737c13f1b401c8413026b8217')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
