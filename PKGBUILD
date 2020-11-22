# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=trsh
pkgver=0.1.1
pkgrel=1
pkgdesc="A TLS encrypted Reverse Shell"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/nanpuyue/trsh"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7514d0ec59db996c60a8fc314e3b2eadd8858253671c6685463e83d793a43337')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/trsh/LICENSE"
  install -Dm755 "target/release/trsh" "$pkgdir/usr/bin/trsh"
}

