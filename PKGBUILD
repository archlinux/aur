# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RnBeads.hg38
_pkgver=1.38.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RnBeads.hg38"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a07ef0e680b3e37429a0f1525bd60155')
b2sums=('28cd4f4806b5051fdbbb2924e7aabd440a5f3202bd884e23082754cb2882e0bbb767b427d6b033cf263d9f3a8eb7755caca8a4b0251c33460f63f66a19d7090c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
