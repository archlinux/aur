# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SMAP
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A Segmental Maximum A Posteriori Approach to Array-CGH Copy Number Profiling"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f29ffdead8f34c2f531dd7ea764febe0')
b2sums=('e2b514e26146d8e3d49dba10c8a3baa1b02a76f9862c2f302a44f11d3433f0988737fffcfb983fea60fb312ffb20bb07a91150d240b695861263256efd6a89cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
