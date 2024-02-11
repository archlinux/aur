# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioMM
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Biological-informed Multi-stage Machine learning framework for phenotype prediction using omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-cmplot
  r-e1071
  r-ggplot2
  r-glmnet
  r-imager
  r-nsprcomp
  r-precrec
  r-ranger
  r-rms
  r-topgo
  r-vioplot
  r-xlsx
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b028b78baf757c1254986fc0e659119a')
b2sums=('cdccf9e5de5a01361d28e54517e7831ec0c7ed1a9c380cfb29421a539a6d08ec75cded33928f61425bd3d606e22dfccc5c70c77afc35ff2ab1f451e2ede3c963')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
