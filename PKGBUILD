# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui
pkgver=2.6.3
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
sha256sums=('a62ff098e892341cfca9941550638f3992af06dd44c5e5d1ebe6665728309571')

build () {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
