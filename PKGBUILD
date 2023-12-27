# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=fastmatch
_pkgver=1.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast 'match()' Function"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ed826f639a8b6d4c8519c1062a3c109')
b2sums=('34ce4a833b5f7d173b944b05c1c5952c85d91bf3e3aac32edd977f31f5c22f2205c8e521ad0d873b620e6aa5c182710667c618b889ffc3986e604076a6b8a64d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
