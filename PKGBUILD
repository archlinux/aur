# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Mergeomics
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative network analysis of omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('79c23eae4d7e6bdd775d0cf9949b7334')
b2sums=('734554345de1b8862eacd009d2163d5e109ce60e51eba86a13e0280aaeff6e505919bffc593c215017e5741d5f12adf1a82f1b430cb4fa9403d31ace4827a9b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
