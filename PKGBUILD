# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui-alpha
pkgver=2.0.0
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver-alpha.11.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
conflicts=(twitch-tui)
sha256sums=('0cb71ec2d82448a5c1d5641247f0ec5d04ea58e364b2028cbf4cf39caa12177d')

build () {
  cd "twitch-tui-$pkgver-alpha.11"
  cargo build --release
}

package() {
  cd "twitch-tui-$pkgver-alpha.11"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
