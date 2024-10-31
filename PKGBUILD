# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LBE
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the false discovery rate"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-qvalue
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('407869685d2147e5aba11fb883f1e7a9')
b2sums=('acd0bb146a0e323e7932fb05f6390d2466c918b0400d00528688b739fd84a0f6b37fe92214453d5aa18edfdf4b4e1f21c29e180e94fffc1170a1ad9a689f4e17')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
