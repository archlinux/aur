#Maintainer: minosariane
pkgname=shellforge
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc='Terminal tool for generating reverse-shells for CTF challenges and educational purposes.'
url=https://github.com/minosariane/Shellforge
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo')
source=("shellforge-$pkgver.tar.gz::https://github.com/minosariane/Shellforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo install --path . --root="$pkgdir" --force
}
