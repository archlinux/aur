# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname="wrt2pdf"
pkgver="0.6"
pkgrel="1"
pkgdesc="Create a PDF out of a plain text file"
arch=("x86_64")
url="https://github.com/loh-tar/$pkgname"
license=("GPL2")
depends=("qt5-base")
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f204671e76bac20c4e039d4bec8bd7a52bdc69c2b62ce68d48ebadd29d8f8a87')

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cmake -DCMAKE_BUILD_TYPE=Release -S "./" -B "build"
  cd build
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/wrt2pdf" "${pkgdir}/usr/bin/wrt2pdf"
#   install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
