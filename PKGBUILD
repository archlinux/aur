# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stemHypoxia
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentiation of Human Embryonic Stem Cells under Hypoxia gene expression dataset by Prado-Lopez et al. (2010)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0bb544fc8a44b021bec74415f4d26b7')
b2sums=('336d27c101f57914036277596f3fb1ffd8ff43ae4e00a5ee136bcbea0df491379862ddb0146c56b91ca9422c5404bcc13f01f65f470c20934c24926f74dd10ed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
