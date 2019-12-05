# Maintainer: df543 <df543@protonmail.com>
pkgname=ss-face
pkgver=2.1.1
pkgrel=1
pkgdesc="A light weight shadowsocks-libev client GUI."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/df543/Shadowsocks-Face"
license=('GPL')
depends=(
  'qt5-base'
  'shadowsocks-libev'
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/df543/Shadowsocks-Face/tar.gz/${pkgver}")
sha1sums=('51ad67ae5d0eadb5378a6ca1b77e32230509a6ba')

build() {
  cd "$srcdir/Shadowsocks-Face-$pkgver"
  mkdir -p build; cd build
  qmake-qt5 ..
  make
}

package() {
  cd "$srcdir/Shadowsocks-Face-$pkgver"
  install -Dm755 build/ss-face "$pkgdir/usr/bin/ss-face"
  install -Dm644 ss-face.desktop "$pkgdir/usr/share/applications/ss-face.desktop"
  install -Dm644 ss-face.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ss-face.png"
}
