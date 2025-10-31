# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UNDO
_pkgver=1.52.0
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
md5sums=('b8b1a38445eeaee922678cf1ea314ba5')
b2sums=('c2bdd701f2637147d5bd4dced7775a0f052c09b38e0c1cbc7b6778d4cd96db50988f229e81b4ce996925b11f84054c129cc4f004faf3588a4a13647fb5511938')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
