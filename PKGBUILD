# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=udisks2-qt5
pkgver=5.0.3
pkgrel=1
pkgdesc='UDisks2 DBus interfaces binding for Qt5'
arch=('x86_64')
url="https://github.com/linuxdeepin/udisks2-qt5"
license=('GPL3')
depends=('qt5-base' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/udisks2-qt5/archive/$pkgver.tar.gz")
sha512sums=('09c0c85c3488c50d8278e2afac14488fb0141bdfb52685694ba6f71ee181255d5156d67a367ac139265a368355358a0ac2598c54757ca466ee077f0aa3f8208d')

build() {
  cd udisks2-qt5-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd udisks2-qt5-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
