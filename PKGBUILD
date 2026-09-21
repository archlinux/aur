# Maintainer: saliherdemk <saliherdem_kaymak@hotmail.com>
pkgname=mozaik
pkgver=0.1.4
pkgrel=1
pkgdesc="Qt6 GUI for managing Hyprland window rules stored in a Lua config"
arch=('x86_64')
url="https://github.com/saliherdemk/Mozaik"
license=('MIT')
depends=('qt6-base' 'hyprland')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c327bc51e6c910b514d0d4f14a1eeb512af03c1e4a6b095005206810beaad75b')

build() {
  cd "Mozaik-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "Mozaik-$pkgver"
  install -Dm755 build/Mozaik "$pkgdir/usr/bin/Mozaik"
  install -Dm644 resources/mozaik.desktop "$pkgdir/usr/share/applications/mozaik.desktop"
  install -Dm644 resources/icons/mozaik.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mozaik.svg"
}
