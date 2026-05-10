# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Rn.eg.db
_pkgver=3.23.0
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
md5sums=('4a04c36b51c846fe13e1dbb71a31079b')
b2sums=('18f68ce959cdc6e27761e7baf42ed25b48be61efdd637c52ccb67d4245172d3b24212c59ccd57cadf529528111d1c734286af049b8b760eede7ca58748d70da0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
