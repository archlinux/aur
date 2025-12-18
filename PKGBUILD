# Contributor: nVjhNFGQWoBQEthk <nVjhNFGQWoBQEthk>

pkgname=mdbook-pandoc
pkgver=0.11.0
pkgrel=1
pkgdesc="A mdbook backend powered by Pandoc."
url="https://github.com/max-heller/mdbook-pandoc"
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc gcc-libs pandoc mdbook)
makedepends=(rust cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fccd4f16656dbbadefdc34129ac4ef464fc8d8b2de8f93d9dbafe43019fc062a')

build() {
  cd mdbook-pandoc-$pkgver
  cargo build --release
}

package() {
  cd mdbook-pandoc-$pkgver
  install -Dm 755 target/release/mdbook-pandoc "$pkgdir"/usr/bin/mdbook-pandoc
  install -Dm 755 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
