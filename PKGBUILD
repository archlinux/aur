# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=udisks2-qt5
pkgver=5.0.4
pkgrel=1
pkgdesc='UDisks2 DBus interfaces binding for Qt5'
arch=('x86_64')
url="https://github.com/linuxdeepin/udisks2-qt5"
license=('GPL3')
depends=('qt5-base' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/udisks2-qt5/archive/$pkgver.tar.gz")
sha512sums=('70b6a4f9a9483760af9e5482cf9a094b79792df93ff58198e167b95892fdf364bf6c738d69d78b679bc4c95f92a4f2ff3b46d8eae948c1e0ea909cfa6594020b')

build() {
  cd udisks2-qt5-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd udisks2-qt5-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
