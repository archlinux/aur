# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui
pkgver=2.2.1
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
conflicts=(twitch-tui-alpha)
sha256sums=('360c0d39d8986b1671da0eb2cc3d036087130a7203774557d274b0c0a5c3f87a')

build () {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
