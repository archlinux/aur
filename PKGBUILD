# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dr.eg.db
_pkgver=3.19.1
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
md5sums=('37ec70550ea420dbc51da7d2e7f28135')
b2sums=('5c9b1370cb28f183005f0d7498ac13af9c6abf2137bf2517edddf93e22ac81917fe31261a8e83d4d9570b8860102f2e76d4cbc6513ab79fa120eaad06c61c9ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
