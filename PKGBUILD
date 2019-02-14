# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=procs
pkgver=0.4.5
pkgrel=1
pkgdesc='A modern replacement for ps written by Rust '
arch=('x86_64')
url='https://github.com/dalance/procs'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('07e722daa3ee81edbb3d850ed75bbe19bd19a4675e184e45e1c0d14e20fa6cac')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
