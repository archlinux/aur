# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UNDO
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unsupervised Deconvolution of Tumor-Stromal Mixed Expressions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-nnls
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c555a60d49d602fbc58a9477e64673a1')
b2sums=('e24b4b740353fc22e469c2aa41116fbb5978fe4d73c5b1d9ab37e4a944f112e9fb61c1003e7d67834d6676242e33b9b480e94c2ae5f44390a76542d0fa9e9018')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
