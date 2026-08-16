# Maintainer: Xuepoo (CI) <xuepoofoter@gmail.com>
pkgname=sigil-wm
pkgver=0.1.0
pkgrel=2
pkgdesc="Invisible structural watermark for images"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sigil"
license=('Apache-2.0')
source=("sigil-$pkgver::https://github.com/Xuepoo/sigil/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
makedepends=('cargo')

build() {
  cd "sigil-$pkgver"
  cargo build --release --locked --features learned,c2pa
}

package() {
  cd "sigil-$pkgver"
  install -Dm755 "target/release/sigil" "$pkgdir/usr/bin/sigil"
}
