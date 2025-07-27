# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=karton
pkgver=git20250727
pkgrel=1
_commit=976b74b5fb63b32faa3a2ccc4f489d43b04734bf
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
sha256sums=('3eaa2cb3b6bc6fe0b8ac88aa3cdb363433f1f4ce8b6c296d7817eba10f5cb407')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
