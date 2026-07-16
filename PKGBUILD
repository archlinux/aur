# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=IlluminaHumanMethylationEPICv2manifest
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=4
pkgdesc="Manifest for Illumina's EPIC v2.0 methylation arrays"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-minfi
)
optdepends=(
  r-eulerr
  r-illuminahumanmethylationepicmanifest
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8d085aa52b1237a3d62daf59b350323')
b2sums=('12c52736f8477657423a527fa5990372754a3ba69056ede784fe1e70872a254a79cbe1683769b2a45e16151dc8a1d3b9af2fee2bc89e53308a78f69ed61ee635')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
