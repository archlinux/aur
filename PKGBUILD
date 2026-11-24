pkgname=xerabora-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Desktop RetroAchievements client with live tracking for a real PlayStation 2 through a patched Open PS2 Loader - prebuilt binary with Discord support"
arch=('x86_64' 'aarch64')
url="https://github.com/hacan359/xerabora"
license=('MIT')
depends=('curl' 'hicolor-icon-theme')
optdepends=('xdg-utils: open the interface in the default browser'
            'libpulse: notification sounds through paplay'
            'alsa-utils: notification sounds through aplay'
            'pipewire: notification sounds through pw-play'
            'discord: rich presense support')
provides=('xerabora')
conflicts=('xerabora')
source=("LICENSE::https://raw.githubusercontent.com/hacan359/xerabora/v$pkgver/client/LICENSE"
        "icon.png::https://raw.githubusercontent.com/hacan359/xerabora/v$pkgver/docs/icon.png"
        "xerabora.service"
        "xerabora.desktop")
source_x86_64=("xerabora-$pkgver-x86_64::https://github.com/hacan359/xerabora/releases/download/v$pkgver/xerabora-linux-x86_64")
source_aarch64=("xerabora-$pkgver-aarch64::https://github.com/hacan359/xerabora/releases/download/v$pkgver/xerabora-linux-aarch64")
sha256sums=('083892fe5ef652a4f3b07aee1383272f9f4d03d518072dc9c85774fcd37658e3'
            '10de7bef918e0f28c1d279f891bd7fb5ca8846a537570a881ca9c7c1a1f2ae95'
            '10893d77fcac28ab2e90729d7fd22e652cb24669bed101f67d95ed7a9a492772'
            'de1f8e91560ee89b6ed3e259fbd1119cbab9daccf10c543e2078fbb6637ad673')
sha256sums_x86_64=('57d68460031ba91cf871e76fcdfc71deb971d55cac0f427ca5539ebf72227fc8')
sha256sums_aarch64=('c50ae04cbd871469da232f11e894b2313d67b657ab7c561c259a89e0afd34294')

package() {
  install -Dm755 "$srcdir/xerabora-$pkgver-$CARCH" "$pkgdir/usr/bin/xerabora"
  install -Dm644 "$srcdir/xerabora.service" "$pkgdir/usr/lib/systemd/user/xerabora.service"
  install -Dm644 "$srcdir/xerabora.desktop" "$pkgdir/usr/share/applications/xerabora.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/xerabora.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
