# Maintainer: venoosoo
pkgname=folder-size
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to calculate folder sizes with options like symlink following and depth limits"
arch=('x86_64')
url="https://github.com/yourusername/folder-size"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('bb4b459966021a4bc5020e1685fa1f29a44d1fa6883a7a6258f02a7f00e2d435')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/folder-size" "$pkgdir/usr/bin/folder-size"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}