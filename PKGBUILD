# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioDist
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Different distance measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-locfit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('33e375ce8913781ec704dee6ecf5e499')
b2sums=('09b712a03e942a00e84c7f4fd2fa0edb09f62187bf7e2f05bddacf70bc807a0243140e791849bdd25873b90b62cf0fec10274526e1d2b87c5e69f0db6ba57d38')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
