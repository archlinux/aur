# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.8
pkgrel=1
pkgdesc='Basic desktop shell using QtWidgets'
arch=(x86_64)
url='https://invent.kde.org/system/liquidshell'
license=(GPL3)
depends=(kcmutils knewstuff networkmanager-qt bluez-qt packagekit-qt5 hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgver.0/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('50847aad7d169af62f2b3a3ed7cf230978467279c65448d546fb8a9975e93bd7'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
