# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ibh
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interaction Based Homogeneity for Evaluating Gene Lists"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-simpintlists
)
optdepends=(
  r-yeastcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('84688e4092149040e21e1194da17303a')
b2sums=('b6a15ecc82ca280b64123461a9bdfa9d0badee1a30d3d11c94616a4246ff5e2d18d6c87d7c3c491e0f0f5169b8fdad0ea85a73e524589e17829c4cf594f4af1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
