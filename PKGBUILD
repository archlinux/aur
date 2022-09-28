# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui-alpha
pkgver=2.0.0
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver-alpha.12.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
conflicts=(twitch-tui)
sha256sums=('fe407dd56eb4474da8be56e45be9d7d41dab7b8a902a8513a9effd55dc331561')

build () {
  cd "twitch-tui-$pkgver-alpha.12"
  cargo build --release
}

package() {
  cd "twitch-tui-$pkgver-alpha.12"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
