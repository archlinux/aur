# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=spotify-tui
pkgver=0.16.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64 aarch64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('2b70ff47b909a886eb364fdcdbcee5e9550ff7cd4a9110b967899fb6377db632e1e9640cd05eefdc12626d40d3d3e08c2fa3d8fd314c9914f3d390aeb76ab796')

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
