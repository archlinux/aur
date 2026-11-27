# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GO.db
_pkgver=3.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of annotation maps describing the entire Gene Ontology"
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
md5sums=('75dd686e4eaffd59852a89e947da3fe8')
b2sums=('419e8e24ced160cd66d48812a36371fc9689b39bf44f007fb629b3f7e8f078d56c3c289a45a68eb5c12b996d02ac584b7f256e1c49fef8651e7b5505ca517ab2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
