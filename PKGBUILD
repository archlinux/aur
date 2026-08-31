# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-welcome-center
pkgver=6.7.4.1
pkgrel=1
pkgdesc='SonicDE onboarding wizard with Silver defaults'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-welcome-center'
license=(LGPL-2.0-or-later)
depends=(glibc
         kcmutils
         kconfig
         kconfigwidgets
         kcrash
         kdbusaddons
         kglobalaccel
         ki18n
         kjobwidgets
         knewstuff
         kservice
         ksvg
         kuserfeedback
         libstdc++
         plasma5support
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-svg
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-quick-ui-addons
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-network-manager)
makedepends=(sonic-frameworks-cmake-modules)
provides=(plasma-welcome)
conflicts=(plasma-welcome)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('82370a6781529cc7c7a88fa3325a0797dd8cebb2e7da90e110afbbf5cde1c68b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
