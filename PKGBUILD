# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tsne
_pkgver=0.1-3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="T-Distributed Stochastic Neighbor Embedding for R (t-SNE)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd73e9defb351ed1295523711a545a71')
b2sums=('8c7189369409278086d222d8962a038a158e095a2eb037a048908da5c1d6996bd583e58fd2411ec938164389fc5bb31ada3af7e1928a98c42e2111c7aa3f2ff5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
