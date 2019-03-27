# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Kosyak <ObKo@mail.ru>

pkgname=qextserialport
pkgver=1.2rc
pkgrel=7
pkgdesc='Cross-platform serial port class libary for Qt'
arch=(x86_64)
url='https://github.com/qextserialport/qextserialport'
license=(MIT)
depends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/qextserialport/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1f1c068206af95c328b165e9ea31006e43faa6ee224aaec6aa0f72d2afa5f011')

build() {
  cd $pkgname-$pkgver
  qmake-qt5
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/qextserialport/"
}
