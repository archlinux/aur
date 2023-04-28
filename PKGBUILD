# Maintainer: pwnwriter < hey@pwnwriter.xyz >

pkgname=haylxon
binary=hxn
pkgver=0.1.5
pkgrel=1
pkgdesc="Blazing-fast and yet Sleuth cameraman to www*"
arch=('x86_64')
url="https://github.com/pwnwriter/haylxon"
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pwnwriter/haylxon/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$binary" "$pkgdir/usr/bin/$binary"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$binary/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$binary/README.md"
}

