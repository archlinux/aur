# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
pkgname=koca
pkgver=0.1.1
pkgrel=1
pkgdesc=' A modern, universal, and system-native package manager'
arch=('any')
url='https://github.com/koca-build/koca'
license=('FSL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin koca
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/koca "$pkgdir/usr/bin/koca"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

