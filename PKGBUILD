# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowDensity
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequential Flow Cytometry Data Gating"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-car
  r-flowcore
  r-flowviz
  r-gplots
  r-polyclip
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18f96a93534fbf4dc39b7c8106576d40')
b2sums=('e3b1144dbfee3b1fed112c3e3aeff4d1c7b3dd336d6254d8454099cbba5e3d513cea01d2097c70427d30550db32d29cd37ed21cb547717ead51fc74bbcc79e92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
