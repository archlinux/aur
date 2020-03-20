# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=spotify-tui
pkgver=0.17.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('6fd24c0409d1307ac84f2f64ffb42096392f3f963510b556afedf2e5489b41cafb69061b9dfe2816a96434028ee5122bf9d9e3d837d66dc61efb7ed9b99b8260')

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
