# Maintainer: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Ivy Foster <joyfulgirl (at) archlinux (dot) us>

pkgname=bibutils
_basename=bibutils
pkgver=6.8
pkgrel=1
pkgdesc="Bibliography conversion tools"
arch=("i686" "x86_64")
url="http://sourceforge.net/p/bibutils/home/Bibutils/"
license=('GPL2')
makedepends=('tcsh')
depends=(glibc)
source=("http://downloads.sourceforge.net/project/${_basename}/${_basename}_${pkgver}_src.tgz")
sha512sums=('0b30809ee45cbfce70b9ffb3932aa5f50a218fe97f47cdf983e01f1ae5a062247cd021295b60dafb42eab1e6ef37fd351145e6e4d374d5790ae692778c3fcf22')

build() {
  cd ${_basename}_$pkgver
  ./configure --dynamic --install-dir "$pkgdir/usr/bin" --install-lib "$pkgdir/usr/lib"
  make
}

package() {
  cd ${_basename}_$pkgver
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
  make install
}
