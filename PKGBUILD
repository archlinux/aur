pkgname=muon_decoder
pkgver=1.1.2
pkgrel=1
pkgdesc="Partical decoder"
arch=('x86_64')
url="https://github.com/Dopple24/muon_decoder"
license=('MIT')
# Maintainer: Radek Roub <roubradek1@gmail.com>
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dopple24/muon_decoder/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/particle_decoder "$pkgdir/usr/bin/muon_decoder"
}
