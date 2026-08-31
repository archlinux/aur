pkgname=niri-autostart
pkgver=0.3.0
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/partanskiy/niri-autostart/archive/refs/tags/v0.3.0.tar.gz")
sha256sums=('f3ce8ea56935abd3279b3b1b1e09124226880c195ee29f08e511227f4de296b3')

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
