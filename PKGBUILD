# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASEB
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict Acetylated Lysine Sites"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e46aa5c212a77b41430473e676eaef9')
b2sums=('8726c6a9e6c99084f519e768e614d4a3cab187a07abf927803bdd928d402345b047d9ea709f874b3031c2edac4af7c36775bb11d176642071f553d6792811626')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
