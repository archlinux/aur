# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopyhelpeR
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Helper files for CopywriteR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60ed63513939473c49274170413189c7')
b2sums=('6ba833f8f7b22c45f8ad45ebfd555e824652122d5547e9668110f99874c989110ed345684162fcb2eb09a711bf4241709243d21599b45071838fb5aef2ab4f25')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
