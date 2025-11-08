# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Cogumelo <cogumelo@tutamail.com>

pkgname=spectacle-no-purpose
pkgver=6.5.2
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
sha256sums=('4641fb164ddb3cfdef77597d8db75218e0c8b7ab63c0bdfc20ca0c7a2420992e')

build() {
  cmake -B build -G Ninja -S spectacle-$pkgver \
   -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

