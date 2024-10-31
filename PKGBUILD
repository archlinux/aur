# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Sc.sgd.db
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Yeast"
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
md5sums=('bbd0c3aa1aa0277c0a72d504042f9eea')
b2sums=('2890f43ba84752226e13045af6516909eac644cc9a28577cc9d2a1a04d625b9b7d72b621a1242da62f8157a03102fdc667f8eb0b85df464314c26d4e018c4ae5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
