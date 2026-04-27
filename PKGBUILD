# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.datetimes
_pkgver=0.0-2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Date and Time Extensions for the 'rebus' Package"
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
md5sums=('f555d4ce2c85c798310a7353150606c5'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('46d3a77cd4b581391e17f6e986094f06d017f8b8b4bcb54c2eb95151f8627e2087b7dce249cd81ca37b37f3da45ea268a0bb6041b1bab5311fd13b1f0cdf5e68'
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
