# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.datetimes
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e9b67009085cfb1ce4bba0a6a3d173b8'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('6fc7976d4eb828ecd3f2eae9f6b807adcb4256c79682f17316d81d4449fb0eb7e0af8c0f0f6455d639849901d115c04e91ddf24a2ca0431ba77f746022710b17'
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
