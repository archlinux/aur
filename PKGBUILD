# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DTA
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Transcriptome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-lsd
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f1d124015e4ebcc7a9ada8b7c981292')
b2sums=('8d472723d48c5214c0a9c5bd3d0f63cd53a7c65d053751b34944aa918ae5332c483da18fd50dbec1d17985c11f10804b86fb7fa3bd7461d00e30235b9b66b45f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
