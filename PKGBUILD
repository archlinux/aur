# Maintainer: saliherdemk <saliherdem_kaymak@hotmail.com>
pkgname=mozaik
pkgver=0.1.3
pkgrel=1
pkgdesc="Qt6 GUI for managing Hyprland window rules stored in a Lua config"
arch=('x86_64')
url="https://github.com/saliherdemk/Mozaik"
license=('MIT')
depends=('qt6-base' 'hyprland')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b13522cb31f5ff5aaa6a31357d513322ca49eeb71e6c5bdc2941770c6d385a92')

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
