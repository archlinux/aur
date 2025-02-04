# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct-kde
_pkgname=qt6ct
pkgver=0.10
pkgrel=1
pkgdesc='Qt 6 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://github.com/ilya-fedin/qt6ct'
license=(BSD)
depends=(qqc2-desktop-style)
makedepends=(cmake qt6-tools)
conflicts=($_pkgname)
provides=($_pkgname)
source=(https://github.com/ilya-fedin/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('7e0fe80813779c24a47cb00469ee44b8d91bf28a3c1b161527753d8dfe43d616')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
