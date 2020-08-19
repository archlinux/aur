# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=udisks2-qt5
pkgver=5.0.5
pkgrel=1
pkgdesc='UDisks2 DBus interfaces binding for Qt5'
arch=('x86_64')
url="https://github.com/linuxdeepin/udisks2-qt5"
license=('GPL3')
depends=('qt5-base' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/udisks2-qt5/archive/$pkgver.tar.gz")
sha512sums=('518e130077f2267939f91027d8dd6bdc7ecf266167bff6bd5dca7ae07b62d7cf5dde939a74dd53e97710b788ab456fb46d458694f1bf631c7704becd353aafcf')

build() {
  cd udisks2-qt5-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd udisks2-qt5-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
