# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-accounts-kcm-git
_name=ktp-accounts-kcm
pkgver=v19.12.3.r13.gb5862da
pkgrel=1
pkgdesc='KCM Module for configuring Telepathy Instant Messaging Accounts'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(telepathy-qt kaccounts-integration)
makedepends=(extra-cmake-modules intltool)
conflicts=(telepathy-kde-accounts-kcm)
source=("git+https://github.com/KDE/$_name.git")
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
