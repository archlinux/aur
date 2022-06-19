# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=xrectsel
_ver=0.3.2
pkgname=xrectsel
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="print the geometry of a rectangular screen region"
arch=(i686 x86_64)
url="https://github.com/ropery/xrectsel"
license=(GPL3)
conflicts=('ffcast<1:2.2.0')  # ffcast used to ship /usr/bin/xrectsel
depends=(libx11)
makedepends=(autoconf automake)
source=("https://github.com/ropery/$_name/archive/$_ver.tar.gz")
sha256sums=('1b4b928bb7270e0531467c1e7f93322c784c7c0dedc13d1d5e53034417fde785')

prepare() {
  cd "$_name-$_ver"
  ./bootstrap
}

build() {
  cd "$_name-$_ver"
  ./configure --prefix /usr
  make
}

package() {
  cd "$_name-$_ver"
  make DESTDIR="$pkgdir" install
}

# vim:st=2:sw=2:et:
