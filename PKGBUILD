# Maintainer: artist for Sonic-DE

pkgname=sonic-interface-libraries
pkgver=6.6.3.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Sonic-DE library and runtime components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-interface-libraries'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kcolorscheme
         kconfig
         kcoreaddons
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         knotifications
         kpackage
         ksvg
         kwidgetsaddons
         libglvnd
         libx11
         libxcb
         qt6-5compat
         qt6-base
         qt6-declarative
         sonic-frameworks-keybind
         sonic-frameworks-windowsystem)
makedepends=(extra-cmake-modules
             kdoctools)
conflicts=(libplasma plasma-framework)
provides=(libplasma)
replaces=(libplasma plasma-framework)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('d34abb2e5998483217472074f11cb4c1f216fc8f56bd6d67f6e5888101ff6a92')

