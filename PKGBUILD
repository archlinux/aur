# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=way-cooler-bg
pkgver=0.3.0
pkgrel=1
pkgdesc='The program that draws a background for Way Cooler'
arch=(i686 x86_64)
url=https://github.com/Immington-Industries/way-cooler-bg
license=(MIT)
depends=(way-cooler atk pango gdk-pixbuf2 gtk3)
makedepends=(rust)
conflicts=(way-cooler-bg-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('68511ddc15f47360a33d8a52b8f63d142e773e6bf4e399c9ad9017403c5d3a3c813493fcde03f99524de7e6dfc5ce25814e0f1679d8b1ab66aedc23d33e795c6')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/wc-bg "$pkgdir"/usr/bin/way-cooler-bg
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/way-cooler-bg LICENSE
}
