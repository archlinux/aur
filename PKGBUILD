# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-send-file-git
_name=ktp-send-file
pkgver=v20.03.80.r4.g2b1c906
pkgrel=1
pkgdesc='A File manager plugin to launch a file transfer job with a specified contact'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(telepathy-kde-common-internals-git)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(telepathy-kde-send-file)
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
