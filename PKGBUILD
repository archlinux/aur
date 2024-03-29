# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genoCN
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="genotyping and copy number study tools"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebc7fc5cb3b5c2bcd98718a7bcd95d6a')
b2sums=('f1ba4cf2c955c7ae94a4bca074110f396a08e2dc1e42fe534266d76848a5c2528ab434b0147c3f0406d5fb708dca1df0603c67709153b9854643bd26806df7c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
