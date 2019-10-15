# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui
pkgver=0.6.2
pkgrel=1
pkgdesc='Spotify for the terminal written in Rust'
arch=(i686 x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('757ee20464caf51f7fb101981b9977425f29bf966dd8936679c19c75318b69c5287857566b9dbe7481a84024ce16c874f1a3f0a5190074c9f1487026f230dfce')

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
