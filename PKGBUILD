# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.unicode
_pkgver=0.0-2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unicode Extensions for the 'rebus' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Unlimited')
depends=(
  r-rebus.base
)
optdepends=(
  r-stringi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "Unlimited")
md5sums=('9db744e0ed60fd0e953118a1a9050703'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('cb6eb7a14ccc249fc438b905a47a37950b8fc970efa9126b6817f5c51dae4bfa6f7bfff2b537a505967264856b0b38e03f2297e0746cd18d3ae5e7d1d2149b39'
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
