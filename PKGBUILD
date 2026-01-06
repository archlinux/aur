pkgname=randomware
pkgver=0.4.2
pkgrel=1
pkgdesc="Defensive malware scanner and response GUI written in Rust"
arch=('x86_64')
url="https://github.com/ayaan511/randomware"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  # install binary but rename it
  install -Dm755 target/release/randomware-gui \
    "$pkgdir/usr/bin/randomware"
}
