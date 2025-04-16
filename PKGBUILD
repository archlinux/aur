# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAPanno
_pkgver=1.43.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotations for City of Hope CpG Island Analysis Pipeline"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('462f43024fdfacde4ea49127cc51977d')
b2sums=('2fbf58053ab0b4aee28b4fd5cfa51b2b758d60b24427941e822d22ae692792aee9a2190b0375c3e56517686a46f1d7c5928eada24a235bb28e7536fc33cf55af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
