# Contributor: nVjhNFGQWoBQEthk

pkgname=mdbook-pandoc
pkgver=0.11.1
pkgrel=1
pkgdesc="A mdbook backend powered by Pandoc."
url="https://github.com/max-heller/mdbook-pandoc"
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc gcc-libs pandoc mdbook)
makedepends=(rust cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6e3811b9b5a2cee67c9d6224e0293ab3548cdeaf7f18116b2a1ee417bfb9bfc')

build() {
  cd mdbook-pandoc-$pkgver
  cargo build --release
}

package() {
  cd mdbook-pandoc-$pkgver
  install -Dm 755 target/release/mdbook-pandoc "$pkgdir"/usr/bin/mdbook-pandoc
  install -Dm 755 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
