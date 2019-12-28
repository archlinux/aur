# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.11.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(i686 x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('d5e25a2f8e2c97d54e8b8ffdbfa6a032bff8eb9ca9d42bb2d75e67886953b6e1575ccf211f57c27b7beeb74fcb00304acfba4e28e5d21a85692593e4b7ef9e70')

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
