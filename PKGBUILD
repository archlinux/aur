# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parmigene
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parallel Mutual Information Estimation for Gene Network Reconstruction"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd9175d28d1efdab627d98c080095b4a')
b2sums=('fe80cc9c98780187fab4dedeb9918a78d6dc8bc1dc77d6e419cda5260b82e55b9eaa20b0ad83c84f1d891c84d45683ac76a1d81d36981f792496a18c16e80b4e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
