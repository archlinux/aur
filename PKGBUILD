# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBCB
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MBCB (Model-based Background Correction for Beadarray)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-preprocesscore
  r-tcltk2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6debb89e8cbf34d22bd095ba36ee4665')
b2sums=('fbc1f9fc0c97e55963b86fb4208393da204dec165356dd8b15c92dd59e88655aa86acd6a858b8215ca87d3f7e6399fc9f34fd1fe0b4c62d1268d99883d6c3695')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
