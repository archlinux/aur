# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GO.db
_pkgver=3.19.1
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
md5sums=('f2488feb5d271a911e796a94b7f80495')
b2sums=('9ed727e78457ac8afc5953d5894be97328f57ed353953a6270c31e36188d8373e2044baf2a5e5bb90323464818600958e6bde7ad439ed9fae031b508e432a54b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
