# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname="wrt2pdf"
pkgver="0.6.1"
pkgrel="1"
pkgdesc="Create a PDF out of a plain text file"
arch=("x86_64")
url="https://github.com/loh-tar/$pkgname"
license=("GPL-2.0-or-later")
depends=("qt6-base" "gcc-libs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cb1e01428ef49ecb7d1ca517418a11ecf98a0f7afecf9014c91c5b2158cf5fab')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cmake -DCMAKE_BUILD_TYPE=Release -S "./" -B "build"
  cd build
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/wrt2pdf" "${pkgdir}/usr/bin/wrt2pdf"
#   install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
