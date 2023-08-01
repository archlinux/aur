# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.9.0
pkgrel=1
pkgdesc='Basic desktop shell using QtWidgets'
arch=(x86_64)
url='https://invent.kde.org/system/liquidshell'
license=(GPL3)
depends=(kcmutils knewstuff networkmanager-qt bluez-qt packagekit-qt5 hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dfc450fcead1cfbcb071ebfcf2fbf88e6ae8658b2448382128a42c9bc7773951'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
