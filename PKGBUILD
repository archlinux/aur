# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=lmom
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="L-Moments"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CPL-1.0')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01a213710c3f74aff1bc048e771e1f37')
b2sums=('bf1e1f6a8584e3213e71cc050e52f371be16514cd2964363ef9a12e3ac55ff31fa3edd10977ffd1a1df10eb519aadf85a6daf7007836d2f3549c4b061f08ba8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
