# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui
pkgver=2.6.6
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
sha256sums=('59706e24cca2fac924159dd1a3197619d6ff41c4ef19d8e3409148b6845ac64e')

build () {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
