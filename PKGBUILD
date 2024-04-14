# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.numbers
_pkgver=0.0-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Numeric Extensions for the 'rebus' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Unlimited')
depends=(
  r-rebus.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "Unlimited")
md5sums=('bc896a0bbe0c0beacdf7e38875b80172'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('0bfa8ac26edbc442da8fd35981e27b695d127594beff0c4d0f69cd89e4aaa8e094e7085f5053ee38039a852429208be10e8c844e15b40f3b3248e7df67b22bcb'
        '76d707bdc00cd0ba4a6f5f889db74d5857938783d7a94fd8d605a5eaf6108501bc17198366109faa7ebc52cc934fb0ef6af4a9aa217b625a8dd22ed84dab9eec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" Unlimited
}
