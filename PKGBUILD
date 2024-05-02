# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Mm.eg.db
_pkgver=3.19.1
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
md5sums=('422505463a76022aa9f422ef9f730f1e')
b2sums=('b44885b03ed598b399a6fc7609e54fe67a115348a174d0ddd0ec54d11f4771df255ac4552f61f959463f40683585089c93e724105337d63be3c0b5212792461a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
