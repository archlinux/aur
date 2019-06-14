# Maintainer: Samuel Walladge <samuel@swalladge.net>
pkgname=pc
pkgver=0.1.0
pkgrel=1
pkgdesc="Command line client for pastebins"
arch=('i686' 'x86_64')
url="https://github.com/swalladge/pc"
license=('APACHE' 'MIT')
makedepends=('cargo' 'git')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/swalladge/pc/archive/v${pkgver}.tar.gz")
sha256sums=('fd3f7ba3d5400563acf3b600b05244f3c81fa09593c2b51942cbd9aeddb0e699')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

