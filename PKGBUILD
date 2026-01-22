# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=BoutrosLab.plotting.general
_pkgver=7.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
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
md5sums=('e3dce909fdd5246aff39a18d7ab21c07')
b2sums=('08e23942a41ce7229e8e7e453825130ed8ff252b1db54800c4fda93bfdb7781c4f21ca597ab6b30886715a5b64bb0f3c246c1d676b98d3174c426e24c3d33609')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
