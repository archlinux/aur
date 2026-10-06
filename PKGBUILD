# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-audio-applet-pulse
pkgver=6.7.5
pkgrel=1
pkgdesc='SonicDE applet for audio volume management using PulseAudio'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-audio-applet-pulse'
license=(LGPL-2.0-or-later)
depends=(glib2
         glibc
         kcmutils
         kconfig
         kdbusaddons
         kdeclarative
         ki18n
         kitemmodels
         kstatusnotifieritem
         ksvg
         libcanberra
         libpulse
         libstdc++
         pulse-native-provider
         pulseaudio-qt
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-quick-ui-addons
         sonic-interface-libraries
         sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(plasma-pa)
conflicts=(plasma-pa)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('051dd160983d956f7ea5e303289d7862794fe8f60cbb73fd8c0efff8b42edf3b')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
