# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COSNet
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cost Sensitive Network for node label prediction on graphs with highly unbalanced labelings"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-bionetdata
  r-perfmeas
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('305b99b9a21a46ca1a2e6feb6d583ec7')
b2sums=('55e2993582bf536402824ae5f3fffbcbd0eb8154ae2eb95e51af5846d9fae0a2ddfff2c2565a4fec4f62b0f3ffe669caef93867259974b904b0e6c66db6b8cd6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
