# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=karton
pkgver=git20250905
pkgrel=1
_commit=9c8cbfb0461e48e77d3ca46bd9311a02f333cb4d
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
sha256sums=('1cc7eda6d66dd1055311b23a7ff2ea0032b14da6adbf5695f733329ce23c67b8')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
