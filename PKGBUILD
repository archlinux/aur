# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FScanR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detect Programmed Ribosomal Frameshifting Events from mRNA/cDNA BLASTX Output"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9ea97e89ac84a322a4b427b7d72e5d9')
b2sums=('85a0cbe162d4d21d8cd97f24016c70877471e807ba9e88f52104b9f42e565b33f3be3d1101446319707d5fc736f04e52f28aae4e3522dcb17b97336e698d6645')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
