pkgname=cargo-profiler
pkgver=0.1.6
pkgrel=1
pkgdesc="A cargo subcommand to profile binaries"
url="https://github.com/pegasos1/cargo-profiler"
depends=('cargo')
arch=('i686' 'x86_64')
license=('Apache 2.0')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('35a113c07b5001e28d03dba58213677d004ea13ec180561ec7d6dca6e9ae074b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
