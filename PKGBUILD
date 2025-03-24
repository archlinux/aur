# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=IlluminaHumanMethylationEPICv2manifest
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
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
md5sums=('d9480f6b284efa2a0e5205c1d21659bf')
b2sums=('e4dad427de1b4cd213fbc4ee7861b92384051bef6a4f7605c4cb319e2c444a7172ad9cc3f5919f177df045523caa01f7d9d8a3ba47d042c1148d35bb30cf22bd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
