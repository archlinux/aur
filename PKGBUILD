# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=twitch-tui
pkgver=2.4.0
pkgrel=1
pkgdesc='Twitch chat in the terminal'
url='https://github.com/Xithrius/twitch-tui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xithrius/twitch-tui/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(cargo git)
conflicts=(twitch-tui-alpha)
sha256sums=('aa19ebb3b74d394a066c731df16346f01e2ef877cd08ab6b05ec03f655fd46f2')

build () {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
}
