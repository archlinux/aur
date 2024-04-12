# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tseriesChaos
_pkgver=0.1-13.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analysis of Nonlinear Time Series"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desolve
)
optdepends=(
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6a6c2a9ad7174c4e7bd046afee70da3')
b2sums=('f36d4577ae4ab54ac5d29d4de76fc69f258264cd1f36af9cabc2f9e98c30052b16a1282f57b45e98f72a186b87f06f6403ed431f2e6861018ee0bfd62de61a06')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
