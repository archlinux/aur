# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCBN
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A statistical normalization method and differential expression analysis for RNA-seq data between different species"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03c274fbc25d15c0964c231f15c1c5fe')
b2sums=('11967c63313ea726c411293f3af1a4c07a3c8e9f7827f896b06dd1ad93c88517d4a7ae547bf750182ef0b52e2e21e7fc72032c104bbb08d6e232c70903d22fa7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
