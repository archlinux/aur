# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nozzle.R1
_pkgver=1.1-1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Nozzle Reports"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('284892dbc261f1e919855a99e20b06ca')
b2sums=('0bdd96b5fe864fe3f3b779281dcfdd267e1f2dde9614d1a930997289ad82eeba2b77125dc1383be67ff9c2217c6829e965baa09ce8d76215c737fec52d3bcc01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
