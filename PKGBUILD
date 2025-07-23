# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maptree
_pkgver=1.4-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mapping, Pruning, and Graphing Tree Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Unlimited')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "Unlimited")
md5sums=('9b669a5243664738742d52ed0f707334'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('8c23540cbb4641555a2d0727465032b218322a2a1786b089133388c5586ca008a6c4c5011c3822dd63bec340b173f9d27636b2232059c8d344291f6cb583527f'
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
