# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.9.0
pkgrel=1
pkgdesc='Spotify for the terminal written in Rust'
arch=(i686 x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('fb850fa5c909b7cb50dc1e8e5e9ce4f9fa4b255c907e93890203e924baf36854fc2d7f2027fa51341380a24316809710f5900d053e711feef2b12f63386419e4')

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
