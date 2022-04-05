# Maintainer: Jeff_WuYo <62562200+Jeff-WuYo@users.noreply.github.com>
pkgname=qt6gtk2
pkgver=0.2
pkgrel=1
pkgdesc='GTK+2.0 integration plugins for Qt6'
arch=('any')
groups=('therepoclub')
url='https://github.com/trialuser02/qt6gtk2'
license=(GPL2)
conflicts=($pkgname-git)
depends=(qt6-svg qt6-base gtk2)
makedepends=(qt6-tools)
source=("${pkgname}-$pkgver.tar.gz::${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('22596853eb3ea663d8f28fb40d97195428b883ec571365ce1b03437f5c75f6bc')

build() {
  cd $pkgname-$pkgver
  /usr/lib/qt6/bin/qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
