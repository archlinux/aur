# Maintainer: Elio Kuster <eliokuster.essay132@passmail.com>
pkgname=textractor
pkgver=0.1.1
pkgrel=1
pkgdesc="Extract text and LaTeX from screenshots and images using OCR and optionally AI"
arch=('x86_64')
url="https://github.com/elio42/TeXtractor"
license=('MIT')
depends=('qt6-base' 'tesseract' 'leptonica' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db59d7edae02e62ecb7b914f745595f3e2d3c42a7ca4170540ffadb7166c5ee2')

build() {
  cmake -B build -S "TeXtractor-$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
