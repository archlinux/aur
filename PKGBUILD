# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=fANCOVA
_pkgver=0.6-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Nonparametric Analysis of Covariance"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('170092ecbafffe6447d3fe583e8a7fa0')
b2sums=('fe95eb867ed5e2fec3ceb19646c71161fdf38ac677c2d68949792311081dd7727c0372be86494a344583052b58b7d0701e30fb71709a925eee75bf952dee0551')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
