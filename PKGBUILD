# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BAGS
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Bayesian Approach for Geneset Selection"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-breastcancervdx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('738eda14cf8c51b1f968e287529b0721')
b2sums=('62594ef39d4ce26be6fd95a5705bb7023b6617a9c489bc16ea61c1b78e165a905d3a797f34b3000744020a2dd5531ef3c9c4474dab93fd503cfd3e8dde96b40b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
