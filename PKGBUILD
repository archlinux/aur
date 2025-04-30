# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=dartR.spatial
_pkgver=0.78
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Applying Landscape Genomic Methods on 'SNP' and 'Silicodart' Data"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-crayon
  r-dartr.base
  r-dartr.data
  r-data.table
  r-ggplot2
  r-raster
  r-sp
  r-stampp
  r-tidyr
  r-vegan
)
optdepends=(
  r-dismo
  r-gdistance
  r-gplots
  r-mmod
  r-popgenreport
  r-rrblup
  r-sf
  r-terra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c999e4cdae941ee78cb29fcbca7ed25e')
b2sums=('9853f780c51b64da02c870949d5df6d77b9f98706161bc446c9154beb0bc077ec585e9208c7e9c8f6faaa329a276b3f0912242169c2caec24c4774bf3d4764ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
