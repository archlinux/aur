# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=IlluminaHumanMethylationEPICv2anno.20a1.hg38
_pkgver=1.0.1
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
md5sums=('5cae8500b75de3d1c2bd0458484aec2a')
b2sums=('ff53f1035fbd49ecf9d67bee9f4b14800e7dda01a0b5061eb59a896072a1d45d55ef7ced5330574a4b662143f620a6a4fe38f467f149cf1a2601457e1a3808f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
