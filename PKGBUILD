# Maintainer: IovAnto <iovine.antonio44@gmail.com>
pkgname=iw-tui
pkgver=0.2.0
pkgrel=1
pkgdesc="TUI app for iNet wireless control (iwctl) wrapper"
arch=('x86_64')
url="https://github.com/IovAnto/iw-tui"
license=('MIT')
depends=('iwd')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IovAnto/iw-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46373c5b1c0dcbeffe9427a2a84cfe35ed8d15d9029739f12129772f239aa3a0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/iw-tui" "$pkgdir/usr/bin/iw-tui"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
