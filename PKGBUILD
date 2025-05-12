# Maintainer: Hermann Mayer <hermann.mayer92@gmail.com>
# Based on: https://archlinux.org/packages/extra/x86_64/zeal/

pkgname=zeal-i3-shortcuts
pkgver=0.7.2
pkgrel=3
pkgdesc='Offline API documentation browser, with X11/i3 shortcut patches'
arch=('x86_64')
url='https://zealdocs.org'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'hicolor-icon-theme'
  'qt6-webengine'
  'qt6-base'
  'qt6-webchannel'
  'sqlite'
  'libarchive'
  'libxcb'
  'libx11'
  'xcb-util-keysyms'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)
conflicts=(
  'zeal'
)
source=("$pkgname::git+https://github.com/Jack12816/zeal#branch=main")
sha512sums=('SKIP')
b2sums=('SKIP')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D ZEAL_RELEASE_BUILD=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
