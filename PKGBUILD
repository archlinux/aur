pkgname=niri-autostart
pkgver=0.0.0
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --locked --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/niri-autostart "$pkgdir/usr/bin/niri-autostart"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
