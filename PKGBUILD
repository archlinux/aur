# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.numbers
_pkgver=0.0-1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('4538e778b617ea5524c92f1acb6d3e01'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('b1f62678275a748e795c906a199a92ddf124922c22cfdf7806010a3e5a508cd13dd354336c47496a1f6f1d0cfa57f171e1e49c76f766645f0477c941d43eea6a'
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
