# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SiPSiC
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate Pathway Scores for Each Cell in scRNA-Seq Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f610f486eb91e80eaa0cf2802a2bcc5')
b2sums=('638c8b29f59855173f524bcc2acf09aa61209a54f820266ff9a2bea1a44d403716b093f8936d2978329b790961f826d236b020c470c81ccc3714d85d814edfcc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
