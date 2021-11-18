# Maintainer: Thulinma <jaron@vietors.com>
pkgname=qt-jdenticon
pkgdesc="Qt5 / C++14 Port of Jdenticon"
pkgver=0.2.0
pkgrel=1
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Nheko-Reborn/qt-jdenticon"
depends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nheko-Reborn/qt-jdenticon/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('2e3c841f7d4258ad5c35d2dc6dea1086')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

