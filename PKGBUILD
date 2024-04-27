# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EnsDb.Mmusculus.v79
_pkgver=2.99.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Ensembl based annotation package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ensembldb
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28bbab743b0d2d550dbfa0bcd3274fad')
b2sums=('c0419d94a9265fb4fbb2cc35c4c700c001b2d2ef702656d29e9fd6134055238fac7145ef80751847106dfea6c117cc833e101798e0d190cd07534633f0e44461')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
