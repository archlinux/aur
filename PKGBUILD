# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MPFE
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the amplicon methylation pattern distribution from bisulphite sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc5d2b0d04a7531cfc47be5c62c59948')
b2sums=('5c70d3425219bb28a760a517e434389a1fb7ce031d98beb7723dd7f0bda5494dd8bcff718c509269caae827449c4e525b388baa77c0afb260699db53bf1e664f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
