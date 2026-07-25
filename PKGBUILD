# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote
pkgver=0.3.4
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs via Ollama"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('99cec7c48f63b6e2cc0008ba396da605e75f70ee4dff1ea4e68f245f6c260b3f')

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
