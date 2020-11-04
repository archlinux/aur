# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.7.2
pkgrel=1
pkgdesc="Basic desktop shell using QtWidgets"
arch=(x86_64)
url="https://invent.kde.org/system/liquidshell"
license=(GPL3)
depends=(kcmutils knewstuff networkmanager-qt bluez-qt packagekit-qt5 hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('510eb6ca4afac27bc914ec0010628bee702756bc9f89044fd9950fb8d508e030'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
