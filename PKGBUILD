# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.0.10
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
provides=(hunter)
conflicts=(hunter hunter-git hunter-holy-git)
source=($url/archive/v$pkgver-holy.tar.gz)
sha512sums=('dd8d51651e882e711657fdc92e7068b6c5964fa4220ede09f2033b64b4b06a5063853a14a80585d1315ce34d5e04406649a50217e72f38647f451e22b81f724b')

build() {
  cd hunter-$pkgver-holy
  cargo build --release
}

package() {
  cd hunter-$pkgver-holy
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
