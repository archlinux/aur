# Maintainer: alpwrk <x@alpwrk.cc>
pkgname=archculars
pkgver=0.1.1
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
sha256sums=('e4a25a6d9eb9c053e0b9894824777a96680b20be21f268ac5b9ccc778b1c389f')
