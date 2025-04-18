# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RnBeads.hg38
_pkgver=1.40.0
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
md5sums=('ad843b83e315495484ca8b7ad42e6e20')
b2sums=('9a62a5406f9e5e5c02d70ff50579b77af4a0429bf5269dfd0f0b01ebe132e9007854f7985648ed3310f9ca37396be8c8c666c072bcef4f45ca48dcbb8a601f80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
