# Maintainer: Elio Kuster <eliokuster.essay132@passmail.com>
pkgname=textractor
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract text and LaTeX from images using traditional OCR and optionally with AI."
arch=('x86_64')
url="https://github.com/elio42/TeXtractor"
license=('MIT')
depends=('qt6-base' 'tesseract' 'leptonica' 'curl')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14c99dd4ca804e02e9703e3ac85b9d056f4178ca0d88a3d4b1df011df963de5b')

build() {
  cmake -B build -S "TeXtractor-$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "TeXtractor-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
