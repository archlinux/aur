# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.base
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Core Functionality for the 'rebus' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Unlimited')
depends=(
  r
)
optdepends=(
  r-stringi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "Unlimited")
md5sums=('20a5b5cfba098baadc034d067b5f8067'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('f104e8d9b6a39d5bfcb43b8ba8a018b00fbaca81f8c97d0d74c776203ab907919cdee8e2f9fbed142cd410a0abe65c668744172e3bd056812ce33b6628ffe1ef'
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
