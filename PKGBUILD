# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=karton
pkgver=git20250820
pkgrel=1
_commit=c5a701055f86b5d8060aaa72d190170f7f08b47a
pkgdesc='A libvirt-based Virtual Machine Manager for KDE'
arch=('x86_64')
url='https://invent.kde.org/sitter/karton'
license=('GPL-3.0-or-later')
depends=(
  gcc-libs
  glib2
  glibc
  kcoreaddons
  ki18n
  kiconthemes
  kirigami
  kirigami-addons
  libosinfo
  libvirt
  qqc2-desktop-style
  qt6-base
  qt6-declarative
  qt6-multimedia
  spice-gtk
)
makedepends=(
  extra-cmake-modules
  git
  vulkan-headers
)
source=("git+https://invent.kde.org/sitter/karton#commit=$_commit")
sha256sums=('a15c2f2efca8fe33c84a85e66a4d2c8394593fdbc73170c564e7d47f095a772d')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
