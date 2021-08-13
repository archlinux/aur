# Maintainer: Samuel Walladge <samuel@swalladge.net>
pkgname=pc
pkgver=0.1.0
pkgrel=3
pkgdesc="Command line client for pastebins"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~swalladge/pc"
license=('APACHE' 'MIT')
makedepends=('cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~swalladge/pc/archive/v${pkgver}.tar.gz")
sha256sums=('0c58e9b1ac13f6c7d31da7ca1a32c4ec40f6c5aa907e220a9f8dad38ba4e5d24')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

