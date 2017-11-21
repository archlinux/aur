# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libopusenc
pkgver=0.1.1
pkgrel=1
pkgdesc="High-level API for encoding .opus files"
arch=('i686' 'x86_64')
url="https://opus-codec.org/"
license=('BSD')
depends=('glibc' 'opus')
options=('staticlibs')
source=("https://archive.mozilla.org/pub/opus/libopusenc-$pkgver.tar.gz")
sha256sums=('02e6e0b14cbbe0569d948a46420f9c9a81d93bba32dc576a4007cbf96da68ef3')


build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix="/usr"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libopusenc/COPYING"
  rm "$pkgdir/usr/share/doc/libopusenc/COPYING"
}
