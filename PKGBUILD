# Maintainer: MedzikUser <nivua1fn@duck.com>
_repo='fffzlfk/hex-rs'
_ver=v0.1.2
_auto_update=true

pkgname='hex-rs'
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple command line hex viewer written in Rust'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('MIT')

source=("$pkgname-$pkgver.tar.gz::$url/archive/${_ver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
