# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigclust
_pkgver=1.1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Statistical Significance of Clustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd1316dcfef8be978b8bc8a0ac533ed2')
b2sums=('67199a0fb4ec99693574cfec10646d8898c5a05b805ef0789d5f79e1c941e6b41babbef3b5524931713f27def8d4020fccc991979990b2f496432d29fe6c6b67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
