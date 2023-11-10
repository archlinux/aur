# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EnsDb.Mmusculus.v79
_pkgver=2.99.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ensembl based annotation package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ensembldb
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28bbab743b0d2d550dbfa0bcd3274fad')
sha256sums=('c7259a4d118b07115c87a906b080a81e1c8a66c203210872c2c6c552f6c1f5fe')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
