# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=telepathy-kde-call-ui-git
_name=ktp-call-ui
pkgver=v20.04.2.r0.g8815182
pkgrel=1
pkgdesc="Voice/Video Call UI for Telepathy"
arch=(x86_64)
url="http://community.kde.org/Real-Time_Communication_and_Collaboration"
license=(GPL)
depends=(telepathy-kde-common-internals-git qt-gstreamer)
makedepends=(extra-cmake-modules git boost)
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
