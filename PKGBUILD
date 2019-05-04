# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=procs
pkgver=0.8.3
pkgrel=1
pkgdesc='A modern replacement for ps written by Rust '
arch=('x86_64')
url='https://github.com/dalance/procs'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f4faa0a4b25dd3304344c75cf8ed4d909fd19e365c5312b6edac0984276ad978')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
