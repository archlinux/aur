pkgname=flas-timer
pkgver=1.0.0
pkgrel=1
pkgdesc="Timer application from FLAS Forum"
arch=('x86_64')
url="https://github.com/FLAS-Forum/timer"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("git+https://github.com/FLAS-Forum/timer.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/timer"  # 👈 wichtig! Hier liegt die Cargo.toml
  cargo build --release
}

package() {
  cd "$srcdir/timer"
  install -Dm755 "target/release/timer" "$pkgdir/usr/bin/flas-timer"
}
