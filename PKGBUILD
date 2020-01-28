# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.13.0
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust'
arch=(x86_64 aarch64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(cargo python)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('fa6ceab4898704fa4ee1c37b817ca959f86487d743efe57634eae1e78dd6cfd7c37595a9d9d16778dd46baba6770b08289ee0c8eaf0bb5d4c313087b2573e9a9')

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
