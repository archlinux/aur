# Maintainer: saliherdemk <saliherdem_kaymak@hotmail.com>
pkgname=mozaik
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt6 GUI for managing Hyprland window rules stored in a Lua config"
arch=('x86_64')
url="https://github.com/saliherdemk/hyprmonitor"
license=('MIT')
depends=('qt6-base' 'hyprland')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('880e0ee1a0a9240606144299ace884ef1a5920abf05a4728a4c11a601c0552eb')

build() {
  cd "hyprmonitor-$pkgver"
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "hyprmonitor-$pkgver"
  install -Dm755 build/Mozaik "$pkgdir/usr/bin/Mozaik"
  install -Dm644 resources/mozaik.desktop "$pkgdir/usr/share/applications/mozaik.desktop"
  install -Dm644 resources/icons/mozaik.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mozaik.svg"
}
