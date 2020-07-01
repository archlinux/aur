# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-desktop-applets-git
_name=ktp-desktop-applets
pkgver=v17.04.3.r22.gffd78d5
pkgrel=1
pkgdesc='The KDE-Telepathy Plasma desktop applets'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(qt5-declarative kwindowsystem)
makedepends=(extra-cmake-modules git)
source=("git+https://invent.kde.org/network/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
