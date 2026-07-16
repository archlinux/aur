# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RolDE
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust longitudinal Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-doparallel
  r-dorng
  r-foreach
  r-matrixstats
  r-qvalue
  r-rngtools
  r-rots
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-printr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09c512267a8f13a3a49ccf832405b68f')
b2sums=('dd84ed500d9cc0d05cb29a2de8972bb87ddbbbfa5f4efd8a14cacd8bce0ce39bb1f937fd5211bce9d15495e6332ecc9304eae63d0568031aacc5e287f3046299')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
