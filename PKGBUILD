# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=conserve
pkgver=0.6.7
pkgrel=1
pkgdesc="Robust portable backup tool written in Rust"
arch=('x86_64')
url="https://github.com/sourcefrog/conserve"
license=('GPL2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0d316ec649bad18aeea2ef132b4f76a03e49eb2033ee9b5675b59a37f55d25a5b647398208acefde4d58444500b28ffeb84512fe649fa3e8f2cd6cd2a5e6eb60')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
