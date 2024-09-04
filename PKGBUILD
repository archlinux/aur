# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesignerplugin
pkgver=5.116.0
pkgrel=2
pkgdesc='Integration of Frameworks widgets in Qt Designer/Creator'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kconfig5 kcoreaddons5)
makedepends=(extra-cmake-modules qt5-tools kdoctools5)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e3cf4f848ae51d0489b977ccdb20dc3131d89a076783f336cda4e39e85ba735e'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
