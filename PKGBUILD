# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=whatsapp-for-linux
pkgver=1.0.6
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
arch=('x86_64')
url="https://github.com/eneshecan/$pkgname/releases"
license=('GPL')
depends=('gtkmm3' 'webkit2gtk')
makedepends=('cmake')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/eneshecan/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b77d554cea71293ffebcca0e99d5cdcf')

build() {
  cd $pkgname-$pkgver
  mkdir -p build/debug && cd build/debug
  cmake -DCMAKE_BUILD_TYPE=Debug ../..
  make
}

package() {
  mkdir -p ../pkg/$pkgname/usr/bin
  mkdir -p ../pkg/$pkgname/usr/share/applications
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/16x16/apps
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/32x32/apps
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/48x48/apps
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/64x64/apps
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/128x128/apps
  mkdir -p ../pkg/$pkgname/usr/share/icons/hicolor/256x256/apps
  install -Dm755 $pkgname-$pkgver/build/debug/$pkgname ../pkg/$pkgname/usr/bin
  install -Dm644 $pkgname-$pkgver/resource/desktop/$pkgname.desktop ../pkg/$pkgname/usr/share/applications
  install -Dm644 $pkgname-$pkgver/resource/icon/16x16.ico ../pkg/$pkgname/usr/share/icons/hicolor/16x16/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/32x32.ico ../pkg/$pkgname/usr/share/icons/hicolor/32x32/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/48x48.ico ../pkg/$pkgname/usr/share/icons/hicolor/48x48/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/64x64.ico ../pkg/$pkgname/usr/share/icons/hicolor/64x64/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/128x128.ico ../pkg/$pkgname/usr/share/icons/hicolor/128x128/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/256x256.ico ../pkg/$pkgname/usr/share/icons/hicolor/256x256/apps/$pkgname.ico
  install -Dm644 $pkgname-$pkgver/resource/icon/$pkgname.png ../pkg/$pkgname/usr/share/icons/hicolor/256x256/apps/$pkgname.png
}
