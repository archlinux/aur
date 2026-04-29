# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Reporting
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Reporting Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-xtable
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('20801cdc4100e18e0b4724dc32020b68')
b2sums=('19ac5743097a3365760b5021a1f252f677bb2d5fe64f3bc6bffe454b4f8682fb9263cd313da94b7bff10bce02eb7ce62a19bc251dd1faed2dd8825c15d12333e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
