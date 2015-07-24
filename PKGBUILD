# Maintainer: Mikhail Burakov <mikhail.burakov gmail com>

pkgname=dbus-c++-chromiumos
appname='dbus-c++'
conflicts=(${appname})
provides=(${appname})
pkgver=master
pkgrel=0
pkgdesc='A C++ API for D-BUS with fixes from Google'
arch=('i686' 'x86_64')
license=('MIT')
depends=('dbus>=1.2.0' 'ctemplate')
makedepends=()
url="http://git.chromium.org/gitweb/?p=chromiumos/third_party/dbus-cplusplus.git"

source=("git+http://git.chromium.org/chromiumos/third_party/dbus-cplusplus.git")
md5sums=('SKIP')

build() {
  cd $srcdir/dbus-cplusplus
  ./autogen.sh --disable-debug --disable-ecore --disable-glib --disable-doxygen-docs --disable-examples --disable-tests --disable-static --prefix=/usr
  make
}

package() {
  cd $srcdir/dbus-cplusplus
  make DESTDIR="${pkgdir}" install
}
