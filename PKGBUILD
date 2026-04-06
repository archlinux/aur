# Maintainer: 0x90shell
pkgname=gamepad-osk-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Gamepad-controlled on-screen keyboard for Linux"
arch=('x86_64')
url="https://github.com/0x90shell/gamepad-osk"
license=('MIT')
depends=('sdl2' 'sdl2_ttf' 'ttf-promptfont')
provides=('gamepad-osk')
conflicts=('gamepad-osk' 'gamepad-osk-git')
install=gamepad-osk-bin.install
source=("gamepad-osk-${pkgver}::${url}/releases/download/v${pkgver}/gamepad-osk"
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "gamepad-osk-${pkgver}" "$pkgdir/usr/bin/gamepad-osk"

  cd "gamepad-osk-${pkgver}"
  install -Dm644 config.toml "$pkgdir/usr/share/gamepad-osk/config.toml"
  install -Dm644 gamepad-osk.service "$pkgdir/usr/share/gamepad-osk/gamepad-osk.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/gamepad-osk/README.md"
}
