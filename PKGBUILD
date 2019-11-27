# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=karlyriceditor
pkgver=3.2
pkgrel=1
pkgdesc="A program which lets you edit and synchronize lyrics with karaoke songs in various formats."
arch=('i686' 'x86_64')
url="https://github.com/gyunaev/karlyriceditor"
license=('GPL')
depends=('ffmpeg' 'qt5-multimedia' 'desktop-file-utils')
source=("karlyriceditor-$pkgver.tar.gz::https://github.com/gyunaev/karlyriceditor/archive/$pkgver.tar.gz")
sha256sums=('67aa863f7e34b8fd76dfc74615da3ff8b761a138be651bcb55d03d54626bddae')
install=$pkgname.install

build() {
  cd karlyriceditor-$pkgver
  qmake
  make
}

package() {
  cd karlyriceditor-$pkgver
  install -Dm755 bin/karlyriceditor $pkgdir/usr/bin/karlyriceditor
  install -Dm644 packages/karlyriceditor.desktop $pkgdir/usr/share/applications/karlyriceditor.desktop
  install -Dm644 packages/karlyriceditor.png     $pkgdir/usr/share/pixmaps/karlyriceditor.png
}