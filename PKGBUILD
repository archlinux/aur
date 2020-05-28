# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.20.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('86d1d5191d597ba752185d1dbf8cc33cfe7a5fbfca3a41bc01254d7b92f494885ff1d754f7e18f499cf4ddd47882cb73ce2363514dbd6b973867e17fe94e1989')

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
