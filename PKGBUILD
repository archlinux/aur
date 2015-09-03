# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=xrectsel
_ver=0.3.1
pkgname=xrectsel
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="print the geometry of a rectangular screen region"
arch=(i686 x86_64)
url="https://github.com/lolilolicon/xrectsel"
license=(GPL3)
conflicts=('ffcast<1:2.2.0')  # ffcast used to ship /usr/bin/xrectsel
depends=(libx11)
makedepends=(autoconf automake)
source=("https://github.com/lolilolicon/$_name/archive/$_ver.tar.gz")
md5sums=('e62966f6ddbd82780a2ab2d2d94bfebb')

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
