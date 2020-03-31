# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.17.1
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('919a5ed0da65e105077a4492b777898aab41b42290d3f01e93c27359e441de59137a0e72cf0cf4cf7921bb92cbd0e4eacbdf2c0213a93aec0299ba1e8710f466')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/spt -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
