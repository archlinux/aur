# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote
pkgver=0.3.5
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs via Ollama"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ffcdda7dc9426c6acf56e214f84a1ebd62b9e3f6e40bc7835bf441d84e4c0d60')

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
