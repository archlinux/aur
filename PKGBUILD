# Maintainer: Adrian Perez Perez <ap393409@gmail.com>
pkgname=sshf
pkgver=1.0.1
pkgrel=1
pkgdesc="SSH Host Manager TUI (Rust)"
arch=('x86_64')
url="https://github.com/Rooterts/sshf"
license=('MIT')
depends=('openssl' 'zlib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rooterts/sshf/archive/v$pkgver.tar.gz")
sha256sums=('edecdca03d85d0c91c63ed6719adc58cdb8d2e46b6ed044cd7ecd41500eae4ec')  # Usa `makepkg -g` para generarlo

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/sshf -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
