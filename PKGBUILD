# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.2.5
pkgrel=2
pkgdesc="Qt5 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('238ebd02e4b07a1bffcbf2d1534492589bce206c3bce0197e075e8cd3f1b16a2867b5e9beb3bc2a0a5e9391acbf20c07d4d5a35f1550b4e71ee663712a8d56c6'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
