# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CFAssay
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical analysis for the Colony Formation Assay"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ac657b11869bc24931964ca248360be')
b2sums=('288ccd12f97e2eacd6897c4545fd62f69edc796ca31517c6a69546f166ec2c83e883a0211e4e19277fa7714dbaa20d1c8a5d1a9efb4bd59ac05031be3f622f82')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
