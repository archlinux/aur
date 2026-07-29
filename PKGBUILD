# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote
pkgver=0.4.1
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs and cloud APIs"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('87c7ffc2d830b2ee7a6c81896835f6d33309f61b9365c88ecec95a0ce29c2c29')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/genote "$pkgdir/usr/bin/genote"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.toml.example "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
