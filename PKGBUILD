# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui
pkgver=2.0.2
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
conflicts=(twitch-tui-alpha)
sha256sums=('e42ec953a4bc9d1703c6bfb144c7eab0ab414c61a1fefc58105185da08d16826')

build () {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
