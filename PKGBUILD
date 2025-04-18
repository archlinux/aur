# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dr.eg.db
_pkgver=3.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Zebrafish"
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
md5sums=('9569ebec12d19dca8fb1a73e27a6c593')
b2sums=('448c9b8b5a8b275c73b4b4ea8ae7cff892b78267d88d4274eaa560c98b3240dce52fdce7df677d39a8ed01d8489a39352c59ae591580fad7be44a1df0ee1c1cb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
