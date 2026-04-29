# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassArray
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analytical Tools for MassArray Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52b56a86b80fed841dd05220f753badd')
b2sums=('0bbbc6dfa5cb31e411382edaa22f496803846b0c5eaf1081012b543e61e4dd749419671b3d9c47a862f2ff1d9aa290e1d0675c229d1e3f8e42a7f9aaa38de991')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
