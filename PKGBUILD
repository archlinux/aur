# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=karton
pkgver=git20260123
pkgrel=1
_commit=07520e06f5a66e9cfe33a298a11e5482a2395aa0
pkgdesc='A libvirt-based Virtual Machine Manager for KDE'
arch=(x86_64)
url='https://invent.kde.org/sitter/karton'
license=(GPL-3.0-or-later)
depends=(gcc-libs
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
         spice-gtk)
makedepends=(extra-cmake-modules
             git)
source=(git+https://invent.kde.org/sitter/karton#commit=$_commit)
sha256sums=('d87b76c5df03a6f57f24c0fae79ce89d19da65549a616648929674fdbae6e020')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
