# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVisGUI
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="HilbertVisGUI"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  atkmm
  glibmm
  gtk2
  gtkmm
  libsigc++
  pangomm
  r-hilbertvis
)
optdepends=(
  r-iranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e9e6a2cce82ff0dfcf0828ae7d123537')
b2sums=('cafe62163b23afa93b138788e4a0b91c0af1fb338822beb27e64176944fb2efd3c1882a15ff97a36290a54c1cf3884dda399196bf11018923eb1d56f89b90854')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
