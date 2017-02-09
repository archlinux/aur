# $Id: PKGBUILD 159441 2016-01-30 05:03:01Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-files
pkgver=0.1.0
pkgrel=2
pkgdesc="The file manager for Papyros"
arch=("i686" "x86_64")
url="https://github.com/lirios/files"
license=("GPL")
depends=("fluid" "taglib")
makedepends=("git" "extra-cmake-modules" "qt5-tools")
replaces=('papyros-files')
source=("git+https://github.com/lirios/files.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/files" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
