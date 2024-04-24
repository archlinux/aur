# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SamSPECTRAL
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Identifies cell population in flow cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2724bc54054c093fac88a672a6b173d6')
b2sums=('527fa7185b84b646ce1652967f5a1ce3b47c9dafabad9877aebd3b6addf07f84082a863f28d6122145440c629c4f36560cd3ae7103aec19863b4c8f39a316e53')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
