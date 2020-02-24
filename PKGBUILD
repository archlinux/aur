# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=spotify-tui
pkgver=0.15.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64 aarch64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('3eae323f8c373056bfd4e48a36f943c5ad468e1a0b893edd98b843c706bcf005d0c5713b6d5fc0761b16473f00ce97defe246c3309f8f87b38fc262c2ea3d3ad')

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
