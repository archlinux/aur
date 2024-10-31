# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISoLDE
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Statistics of alleLe Dependent Expression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('191e6a6d928c52508fb3f8be15ba9a34')
b2sums=('56cedd03d3b738c40eb36658c37ac4a48436b8633f4d4a714ba4f09dc08437d1bf69f3b2e90f4c7784fde75a87e71a874bb19fb56e32b05502bf4d05600da7fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
