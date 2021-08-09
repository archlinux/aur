# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rtrtr
pkgver=0.1.2
pkgrel=1
pkgdesc="An RPKI data proxy"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/rtrtr/"
license=('BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/rtrtr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef86611b9cb8e5c69f5f7694bc2b8c0359f290ca1a8263c7c3f7c8a15a54aa75')


check() {
  cd "rtrtr-$pkgver"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "rtrtr-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/rtrtr-$pkgver"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rtrtr"
}
