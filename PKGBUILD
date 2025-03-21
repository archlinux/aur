# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=BoutrosLab.plotting.general
_pkgver=7.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='Functions to Create Publication-Quality Plots'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-only')
depends=(
  r-e1071
  r-gridextra
  r-gtable
  r-hexbin
  r-latticeextra
)
optdepends=(
  r-cairo
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d83e0248ecc68fd34661900af9d9365d')
b2sums=('93713db61f52d7d54965938e981446db6dbcf629b2bf7eab8a2d6c2ee21346f6f080f0337dc19ab9cbf122419fd73d9ea6971f73c8f801d4a8aa50bef868fd40')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
