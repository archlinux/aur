# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.2.7
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('1deb2e6cfccaae06ec3d0f3126d463773d9977cd5616bd15b20a668a5b08ae6d0ccb4212393a2ffdca90c247250cd58735e49e4fdda1941b805c86caf29cfcb3'
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
