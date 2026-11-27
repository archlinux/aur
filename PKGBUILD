# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blockmodeling
_pkgver=1.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized and Classical Blockmodeling of Valued Networks"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-doparallel
  r-dorng
  r-foreach
  r-sna
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5face1332bb274eb5aabf11a65563aa1')
b2sums=('af159a6504a27976921eec6a03296c1c7bc07d9ec8cf822fefc161dbb1433c6bb9e957e2adf866a638a178ff311fd2fab4860b5178322ae8666ca11272467cc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
