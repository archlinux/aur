# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=trsh
pkgver=0.1.2
pkgrel=1
pkgdesc="A TLS encrypted Reverse Shell"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/nanpuyue/trsh"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a824488c438d5b690b653319a75a58b80f97252d7a30dba4bd420f69741ea529')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/trsh/LICENSE"
  install -Dm755 "target/release/trsh" "$pkgdir/usr/bin/trsh"
}

