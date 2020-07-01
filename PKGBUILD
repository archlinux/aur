# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-auth-handler-git
_name=ktp-auth-handler
pkgver=v17.04.3.r15.ge261fbb
pkgrel=1
pkgdesc='Provide UI/KWallet Integration For Passwords and SSL Errors on Account Connect'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(qca-qt5 telepathy-kde-common-internals-git)
makedepends=(extra-cmake-modules git)
conflicts=(telepathy-kde-auth-handler)
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
