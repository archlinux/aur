# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=trsh
pkgver=0.1.2
pkgrel=2
pkgdesc="A TLS encrypted Reverse Shell"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/nanpuyue/trsh"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c0867e0e92609d3f37098bc16c4b7e72c922fe3f4c51c995a876c90a4eacd88c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/trsh/LICENSE"
  install -Dm755 "target/release/trsh" "$pkgdir/usr/bin/trsh"
}

