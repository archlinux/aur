# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lizard
pkgver=2.1
pkgrel=1
pkgdesc="An efficient compressor with very fast decompression"
arch=('i686' 'x86_64')
url="https://github.com/inikep/lizard"
license=('BSD-2-Clause' 'GPL-2.0-or-later')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/inikep/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0c1a7efceeb8ae66bfa2b7b659f01dec120925d846b01ce4dfc6960ba8cd61e5')


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
