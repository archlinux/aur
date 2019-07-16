# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=udisks2-qt5
pkgver=0.0.2
pkgrel=1
pkgdesc='UDisks2 DBus interfaces binding for Qt5'
arch=('x86_64')
url="https://github.com/linuxdeepin/udisks2-qt5"
license=('GPL3')
depends=('qt5-base' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/udisks2-qt5/archive/$pkgver.tar.gz")
sha512sums=('8a7e0b262919e72c03a1fa018d97868ed9388f343816ae9eee340f21bf3a209bf882efcf0361e76e7d4cfd4b6391cb6a42d96810fdc5315b87a699059163ae0b')

build() {
  cd udisks2-qt5-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd udisks2-qt5-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
