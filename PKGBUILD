# Maintainer: alpwrk <x@alpwrk.cc>
pkgname=archculars
pkgver=0.1.2
pkgrel=1
pkgdesc="A modern and fast AUR seeker"
arch=('x86_64')
url="https://github.com/alpwrk/archculars"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/archculars "$pkgdir/usr/bin/archculars"
}
sha256sums=('82f896c5c9f41d84a9ed5b68a87fa757abb5a2b9f045ea3360a089bb6cfd5a74')
