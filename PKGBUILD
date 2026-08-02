# Maintainer: naimish naimish@naimish.xyz
pkgname=chipeu
pkgver=1.1
pkgrel=1
pkgdesc="A simple and clean Chip-8 interpreter written in C++ with SDL2."
arch=('x86_64')
url="https://github.com/theroguevigilante/chipeu"
license=('AGPL')
depends=('sdl2')
makedepends=('gcc')

source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6a9f354ea68c006ec173c745c8da0645b108a5ba9f45a1f3695b19bb77619bc2')

build() {
  cd "$pkgname-$pkgver"
  g++ -std=c++17 -O2 main.cpp chipeu.cpp -o chipeu -lSDL2
}

package() {
  cd "$pkgname-$pkgver"

  install -d "${pkgdir}/usr/bin"
  install -m755 chipeu "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
