# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpNet
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Programming Model for Network Inference"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-kegggraph
  r-lpsolve
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ecfcfaf70737985e41aa95cc6a7b32dc')
b2sums=('903f843c27534ee1c2a9c453ec876371063a572146406d8da3ce11dba6ac1e7e84731191cc6be9c5e72a5ede7f85d876374e84a2462c8f088d551c8759ec2a13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
