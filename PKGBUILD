# Maintainer: Anton Schäfer <FLAS-Support@proton.me>
pkgname=flas-timer
pkgver=1.0.0
pkgrel=1
pkgdesc="Ein einfacher CLI-Timer in Rust (z. B. 'timer 2m30s')"
arch=('x86_64')
url="https://github.com/FLAS-Forum/timer"
license=('MIT')
depends=('gcc' 'glibc')
makedepends=('rust' 'cargo' 'git')
source=("flas-timer::git+https://github.com/FLAS-Forum/timer.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/flas-timer"
  cargo build --release
}

package() {
  cd "$srcdir/flas-timer"
  install -Dm755 target/release/timer "$pkgdir/usr/bin/timer"
}
