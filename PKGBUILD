# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.4.0
pkgrel=1
pkgdesc='Spotify for the terminal written in Rust'
arch=(i686 x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('b66d65e6d702272769c9634a7c4bb0254a2c70b06571037a075ef512544ce0facf942e524bb8439e277dbb400a6e811ffc64c62e6ca2167e3622b43d0039f535')

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
