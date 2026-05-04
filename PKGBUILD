# Maintainer: Stefan Heiden stefanheiden@tuta.com
pkgname=polpettone-pomodoro-timer
pkgver=0.3.1
pkgrel=1
pkgdesc="A minimalistic CLI Pomodoro timer for productivity with customizable intervals"
arch=('x86_64')
url="https://github.com/polpettone/polpettone-pomodoro-timer"
license=('MIT')  
depends=('glibc')
makedepends=('rust' 'cargo')
source=("https://github.com/polpettone/polpettone-pomodoro-timer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ed5dc49c025b9fe17421fc373410ee3d20b630b4331d40c3268ac22e274e58e')

build() {
  cd "$srcdir/polpettone-pomodoro-timer-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/polpettone-pomodoro-timer-$pkgver"
  install -Dm755 "target/release/polpettone-pomodoro-timer" "$pkgdir/usr/bin/polpettone-pomodoro-timer"
}
