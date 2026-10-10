# Maintainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.3.0
pkgrel=1
pkgdesc="A TUI for managing systemd services"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
depends=()
license=('MIT')
makedepends=('git' 'cargo')
source=("https://github.com/matheus-git/systemd-manager-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9e3672a70b535b713abd2d5e01c65b0b2e0b2a51167508c8fd420bd1145e29e')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "target/release/systemd-manager-tui" "$pkgdir/usr/bin/systemd-manager-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
