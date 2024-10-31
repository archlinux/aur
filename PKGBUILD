# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Rn.eg.db
_pkgver=3.20.0
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
md5sums=('b3c38250a9c848390589cbecd663fc69')
b2sums=('74017472bfda331ea6c652393b926e46f0e93014dbad22106ee710f08d2fa106886dd6982555bb7e5173da43dd5bb3c3043a144de9a76a6a4a8d35f8b35959be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
