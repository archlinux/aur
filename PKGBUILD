# Maintainer: Braindamage
pkgname=multimidicast
pkgver=1.4
pkgrel=1
pkgdesc="multimidicast sends and receives MIDI from Alsa sequencers over your network, It is designed to interoperate with QmidiNet, TouchDAW, and ipMIDI."
arch=('x86_64' 'armv7l' 'aarch64')
url="https://llg.cubic.org/tools/multimidicast/"
license=('BSD')
depends=('alsa-lib')
groups=('pro-audio')
source=("https://llg.cubic.org/tools/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5aff3b4ade85b02c0becd6e8dd74b689e3d7246e0237be572fceec169b3d68c6')

prepare() {
  cd "$pkgname-$pkgver"
   head -n 21 "$pkgname.cpp" > LICENSE
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -vD "$pkgname" -t "$pkgdir/usr/bin/"
  install -vDm 644 README -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
