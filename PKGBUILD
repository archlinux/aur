# Maintainer: Xuepoo (CI) <xuepoofoter@gmail.com>
pkgname=sigil-wm
pkgver=0.2.0
pkgrel=1
pkgdesc="Invisible structural watermark for images"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sigil"
license=('Apache-2.0')
source=("sigil-$pkgver::https://github.com/Xuepoo/sigil/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66d7daa38bd8f799f8c1e79a3c598fef8051d1be8b8c1e16e5ef02c9f60686dd')
makedepends=('cargo')

build() {
  cd "sigil-$pkgver"
  cargo build --release --locked --features learned,c2pa
}

package() {
  cd "sigil-$pkgver"
  install -Dm755 "target/release/sigil" "$pkgdir/usr/bin/sigil"
}
