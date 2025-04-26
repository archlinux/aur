# Contributor: zhjie <smthzhj at gmail dot com>
# Maintainer: zhjie <smthzhj at gmail dot com>
pkgname=qterm
pkgver=0.8.2
pkgrel=1
pkgdesc='QTerm is a BBS (Bulletin Board System) client program. It runs on GNU/Linux, OS X and Windows thanks to the cross-platform framework Qt.'
arch=('x86_64')
url='https://github.com/qterm/qterm'
license=('GPL3')
depends=('qt6-5compat' 'qt6-wayland')
makedepends=('cmake' 'qt6-tools')
provides=('qterm')
source=('https://github.com/qterm/qterm/archive/refs/tags/0.8.2.tar.gz')
md5sums=('4bcaa017ad1b26fb870949ec5140c253')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
