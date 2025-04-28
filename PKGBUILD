# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix.data
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for the EpiMix package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad0cc9a17b60729d4e737e539fe364e5')
b2sums=('557ed238229c4f5dca4867f98a8c1be3efce9622089720dcdccb94033e8ad6757440fa5bfdbc940a40b1de78a5ae3cce73ee75e1e5a07900f6f9e3252e9851bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
