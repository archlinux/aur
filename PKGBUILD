# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Mm.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Mouse"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc19f63b25a7a8018e46f71e42e2f83f')
b2sums=('f31679e2637b21f3f84cd776b00f651fbbe7fa9f1af346e1cf374754bbaa76fce391227c5a29647fbcb115f9718ae94f4f1937099c8c0fcc7adbf050b083c5aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
