# Maintainer: Adrian Perez Perez <ap393409@gmail.com>
pkgname=sshf
pkgver=1.0.0
pkgrel=1
pkgdesc="SSH Host Manager TUI (Rust)"
arch=('x86_64')
url="https://github.com/Rooterts/sshf"
license=('MIT')
depends=('openssl' 'zlib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rooterts/sshf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73089cdd48eba2953f64abcba44691c5ef20166aabe32af7337475d85b43c887')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/sshf -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
