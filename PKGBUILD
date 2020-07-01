# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-filetransfer-handler-git
_name=ktp-filetransfer-handler
pkgver=v17.04.3.r15.g8a94580
pkgrel=1
pkgdesc='KDE Telepathy file transfer handler'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(telepathy-kde-common-internals-git)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(telepathy-kde-filetransfer-handler)
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
