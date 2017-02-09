# $Id: PKGBUILD 159441 2016-01-30 05:03:01Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=papyros-files
pkgver=0.1
pkgrel=1
pkgdesc="The file manager for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/files-app"
license=("LGPL")
depends=("qml-material" "taglib")
makedepends=("git" "cmake" "qt5-tools")
source=("git+https://github.com/papyros/files-app.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/files-app" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
