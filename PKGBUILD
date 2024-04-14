# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Preproc
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Automated Affymetrix Array Analysis Preprocessing Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d9eea3d9957fc99156115052398f0cb')
b2sums=('9252654f37ea643d2a552861eaf72fb8201f879562ff798a2e504abe3ce14a88195be90729a0cfea70a1f49b87d054ed5bba6ac9d673e0438b05c335502940cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
