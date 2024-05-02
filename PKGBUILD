# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UNDO
_pkgver=1.46.0
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
md5sums=('233d7bf4b4a3340a2559f865ced179c4')
b2sums=('ecd213226c74a1e405ca7b7b6eb764732a99c06972119c72777e236aab070c73003084ea06e2be8c7c875cdd7d0d6eb4058512507fdee81de8e381ec3a493861')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
