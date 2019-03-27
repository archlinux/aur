# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=udisks2-qt5
pkgver=0.0.1
pkgrel=1
pkgdesc='UDisks2 DBus interfaces binding for Qt5'
arch=('x86_64')
url="https://github.com/linuxdeepin/udisks2-qt5"
license=('GPL3')
depends=('qt5-base' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/udisks2-qt5/archive/$pkgver.tar.gz")
sha512sums=('96623270b4955b01d078d0957b60aa586aa36340b48c1388b326bb621301dec2994a2c15fc68ab98d94ca574b73e648db8714bf6267cd22ad504e2e702df3a27')

build() {
  cd udisks2-qt5-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd udisks2-qt5-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
