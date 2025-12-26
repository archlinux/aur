# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dr.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Zebrafish"
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
md5sums=('ddff2cc35e8630c4964d2c7765006624')
b2sums=('c1c351028295df7c6679f83e7332254f5d3ce0ec643284b09232981b17e4693d6c111a728b102ae019677906f3ad65a2087fa6440667055620e5e33a99c1e33f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
