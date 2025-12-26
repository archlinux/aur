# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Hs.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Human"
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
md5sums=('e80cac6ec018a95aea4f7530350e80a2')
b2sums=('a44fa8fdf76e6bc5b707dd96a55a9ee526fe1c50b79315a62f29fb5bf2d8947d57d33640e45b89d2e3dcab67024fb2ab71771580c3b86f8d66d2e4f63d1d1526')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
