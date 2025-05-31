# Maintainer: Stefan Heiden stefanheiden@tuta.com
pkgname=polpettone-pomodoro-timer
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI-Pomodoro-Timer"
arch=('x86_64')
url="https://github.com/polpettone/polpettone-pomodoro-timer"
license=('MIT')  
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/polpettone/polpettone-pomodoro-timer.git#tag=v${pkgver}")
sha256sums=('SKIP') 

build() {
  cd "$srcdir/polpettone-pomodoro-timer"
  cargo build --release
}

package() {
  cd "$srcdir/polpettone-pomodoro-timer"
  install -Dm755 "target/release/polpettone-pomodoro-timer" "$pkgdir/usr/bin/polpettone-pomodoro-timer"
}
