# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SLqPCR
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for analysis of real-time quantitative PCR data at SIRS-Lab GmbH"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('017b00f842470852ac0dc22596f3a41e')
b2sums=('b3547558ca3b1c6a1f9a05f90077a3e5e6c42ba7c9b34eb40879761c8b082d56501b7a0f289bd8661f1355947ba046744f20e1d712676c24cbc9e51a3b6a8e27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
