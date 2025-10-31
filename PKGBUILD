# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEAdata
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene set collections for the EGSEA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-ND-4.0')
depends=(
  r
)
optdepends=(
  r-egsea
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3b6681506c005f0ba49851aac6fd164')
b2sums=('0e71ab52b0e511caddca5cb108b9943db2c72ceae37005be0f33fce33ffcf7e6d0c8c8b5a953048aa47d04979ef98633ecf97d62c0f4ac75d5d48e31cc5fdb44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
