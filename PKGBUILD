# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.65
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
depends=('glib2')
makedepends=('git')
_commit="e60bb18dcc299efa936f5a73d2073e6e04a40daf" # tags/1.0.65
source=(${pkgname}::git+https://github.com/sailfishos/libglibutil.git#commit=${_commit})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd ${pkgname}
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd ${pkgname}
  make install-dev DESTDIR="${pkgdir}"
}
