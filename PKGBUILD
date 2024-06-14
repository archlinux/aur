# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DEoptim
_pkgver=2.2-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Global Optimization by Differential Evolution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-colorspace
  r-foreach
  r-iterators
  r-parallelly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8640e68c8895aeabe5d3ff3d79f64392')
b2sums=('9fcde6538cb454e16d43f298abed1dcac07be01bca6e7562b08d70c48052962f9a0cede9ab93cc3999c4e095eb1a064aef76a59fd583e36ad32a489a972e94d9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
