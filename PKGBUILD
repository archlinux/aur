# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>

pkgname=riftbar
pkgver=0.2.6
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
sha256sums=('47f0cbe0f6de2eba7110ec0a49f0f2039c6324cd5d0689983e0d469c35439597')


build() {
  cd "$srcdir/riftbar"
  cargo build --release
}

package() {
  cd "$srcdir/riftbar"

  install -Dm755 target/release/riftbar "$pkgdir/usr/bin/riftbar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
