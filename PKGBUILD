# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OnassisJavaLibs
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run conceptmapper and semantic similarity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7e7c34ca783e17c85f23238cb932a1a2')
b2sums=('d72b0aada6f752adb185aa435c4a85f3a3db8790310bc82b171569cfc83599554713116fddc2a21c8a6fbdc7daa3502086dfb409b7149a25529c10646c70234d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
