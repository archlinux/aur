# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=IlluminaHumanMethylationEPICv2anno.20a1.hg38
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Annotation for Illumina's EPIC v2.0 methylation arrays"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-minfi
)
optdepends=(
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c352dbfcc084a2873a1a56d2fec1928')
b2sums=('6ebe46256b12a3bdd55607bd953fe22dd158b905cc1596f1740cef82f49d0a89b99047342bffdf23358e6cb8a798b7e75883d4fa99dd6fc15737e5e6de69ec5c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
