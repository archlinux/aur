# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=poLCA
_pkgver=1.6.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Polytomous Variable Latent Class Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('50ad379b144dad1e3c3734f2717e32c7')
b2sums=('f27c15e59e384431f428b4e1f9e07236d77009b4825977d47e8764f568d15a397580bbe1b253b1d25c13164c1f42200b377416cea1ec6673bb9e041ca3639660')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
