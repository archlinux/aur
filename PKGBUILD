# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Cogumelo <cogumelo@tutamail.com>

pkgname=spectacle-no-purpose
pkgver=6.5.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
epoch=1
pkgdesc='KDE screenshot capture utility, without the dependency on purpose. This disables the share menu'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kguiaddons
         ki18n
         kio
         kirigami
         kjobwidgets
         knotifications
         kpipewire
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         layer-shell-qt
         libxcb
         opencv
         prison
         qt6-base
         qt6-declarative
         qt6-imageformats
         qt6-multimedia
         wayland
         xcb-util
         xcb-util-cursor
         xcb-util-image)
makedepends=(extra-cmake-modules
             kdoctools
             plasma-wayland-protocols
             ninja)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/spectacle-$pkgver.tar.xz)
sha256sums=('cf150166ecd4b40c2fa7b3b4761cee22ff08b2cc8da68cf8cd6ffc0efc78c8b7')

build() {
  cmake -B build -G Ninja -S spectacle-$pkgver \
   -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

