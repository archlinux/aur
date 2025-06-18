# Maintainer: Anton Schäfer <FLAS-Support@proton.me>
pkgname=timer
pkgver=1.0.0
pkgrel=1
pkgdesc="Ein einfacher CLI-Timer in Rust (z. B. 'timer 2m30s')"
arch=('x86_64')
url="https://github.com/FLAS-Forum/timer"
license=('MIT')
depends=('gcc' 'glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver"::"git+file://$PWD")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/timer "$pkgdir/usr/bin/timer"
}
