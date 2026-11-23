# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=SKAT
_pkgver=2.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="SNP-Set (Sequence) Kernel Association Test"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rspectra
  r-spatest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1eeba626224438128a4d8b3d5e070c79')
b2sums=('7b2d6d80a266e5abf27dcbebe17f8ec02552ca7149e94b409a15a9b491b0dd86acd81ae2579a8a28f1f150f132728697b859e5fe82218213d1f2be757414e8e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
