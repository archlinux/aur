# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-contact-runner-git
_name=ktp-contact-runner
pkgver=v17.04.3.r19.g9750999
pkgrel=1
pkgdesc='KRunner plugin for KDE Telepathy'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(telepathy-kde-common-internals-git krunner)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(telepathy-kde-contact-runner)
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

