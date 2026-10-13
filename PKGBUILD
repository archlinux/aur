# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>

pkgname=riftbar
pkgver=0.2.8
pkgrel=1
pkgdesc="Highly customizable GTK4 bar for Wayland written in Rust"
arch=('x86_64')
url="https://codeberg.org/sorashii/riftbar"
license=('GPL-3.0-only')

depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland')

makedepends=('cargo')


source=("https://codeberg.org/sorashii/riftbar/archive/v$pkgver.tar.gz")
sha256sums=('c91df19130815e1a44ec762b441eb54e39606f9c845205d452529aa1fbc88ff1')


build() {
  cd "$srcdir/riftbar"
  cargo build --release
}

package() {
  cd "$srcdir/riftbar"

  install -Dm755 target/release/riftbar "$pkgdir/usr/bin/riftbar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
