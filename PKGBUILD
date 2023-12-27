# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maptree
_pkgver=1.4-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Mapping, Pruning, and Graphing Tree Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Unlimited')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "Unlimited")
md5sums=('8db023baa8f3000ff384d846cb0d4815'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('98c388b5bc414d315c463c33027a88402144fb67ed93c0745793a074c2b0acdb3d9ed9234c986c56d9318f76fbfe10f8a8d7b26353d8bdf366962b7ddb472810'
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
