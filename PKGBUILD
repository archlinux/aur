# Maintainer: Clement Vassaux <locoxduturfu@gmail.com>
pkgname=kotofetch
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimalist fetch tool for Japanese quotes (written in Rust)"
arch=('x86_64')
url="https://github.com/hxpe-dev/kotofetch"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!debug')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/kotofetch" "$pkgdir/usr/bin/kotofetch"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

