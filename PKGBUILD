# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=procs
pkgver=0.4.4
pkgrel=1
pkgdesc='A modern replacement for ps written by Rust '
arch=('x86_64')
url='https://github.com/dalance/procs'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('362900043c4d5253bd10a8ba8b4ae5de99fc469979237a7ef10892678702bef6')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
