# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.7.5
pkgrel=1
pkgdesc='Spotify for the terminal written in Rust'
arch=(i686 x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('db6add3a242506cc5a5d6088e93450f03f0c0985cb4cd6a3b84c4100e6d23024ee7adb0377ae5725a712fb51b8235e60c1e46cc16f96181b9abeeb441593420a')

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
