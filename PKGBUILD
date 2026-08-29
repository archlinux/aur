# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=rowed
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, interactive SQLite database editor"
arch=('x86_64')
url="https://github.com/Undercat037/rowed"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/Undercat037/rowed.git#tag=v$pkgver")
sha256sums=('89faf33089c5a92b561e3ddf2899466dd3a808d6a8bd5320fb7ee992bc1f00ec')

build() {
  cd "rowed"
  cargo build --release
}

package() {
  cd "rowed"

  install -Dm755 target/release/rowed "$pkgdir/usr/bin/rowed"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
}
