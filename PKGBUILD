# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=turnon
pkgver=2026.11
pkgrel=1
pkgdesc='Turn on devices in your network'
url='https://codeberg.org/swsnr/turnon'
arch=(x86_64)
license=(EUPL-1.2)
depends=(glibc
         libstdc++
         kcoreaddons
         kdbusaddons
         kwindowsystem
         ki18n
         kirigami
         qqc2-desktop-style
         qt6-base
         qt6-scxml
         qt6-declarative)
makedepends=(git extra-cmake-modules)
source=("git+${url}#tag=v${pkgver}")
sha256sums=('225f1a0cef4fb1ec252a92a851a458ec89a3f44d17a1f377f5a876e8e2801422')

build() {
  cmake -B build -S "${pkgname}" -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

