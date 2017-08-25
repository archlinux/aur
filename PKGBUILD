# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lizard
pkgver=1.0
pkgrel=2
pkgdesc="An efficient compressor with very fast decompression"
arch=('i686' 'x86_64')
url="https://github.com/inikep/lizard"
license=('GPL2' 'BSD')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/inikep/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6f666ed699fc15dc7fdaabfaa55787b40ac251681b50c0d8df017c671a9457e6')


build() {
  cd "$pkgname-$pkgver"

  make
}

check() {
  cd "$pkgname-$pkgver"

  #make test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "lib/LICENSE" "$pkgdir/usr/share/licenses/lizard/LICENSE"
}
