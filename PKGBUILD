# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.unicode
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
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
md5sums=('e1ad36113be3b809e1a03e2fa235c22c'
         'd5a357f0c20cfc67aa3d7321a7f25668')
b2sums=('50584b0589dd3a5a922e85fe29945e3d98b889bb27006c775a080618adc2ffe877d7dc1a8578a400911680759ed0ceb1a32087ab31e7702a034ccd99645a3a47'
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
