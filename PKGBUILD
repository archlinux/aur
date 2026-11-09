# Maintainer: methamphetaminelab <https://github.com/methamphetaminelab>

pkgname=gramtty-bin
_pkgname=gramtty
pkgver=1.0.0
pkgrel=1
pkgdesc='A terminal Telegram client (prebuilt binary, TDLib linked statically)'
arch=('x86_64')
url='https://github.com/methamphetaminelab/gramtty'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
optdepends=(
  'mpv: playing video, video notes and voice messages'
  'ffmpeg: video and sticker previews, upload thumbnails, voice encoding'
  'pipewire-audio: pw-record for voice messages, pw-play for notification sound'
  'opus-tools: opusenc for voice messages (alternative to ffmpeg)'
  'libnotify: desktop notifications (notify-send)'
  'libcanberra: notification sound (canberra-gtk-play, alternative to pw-play)'
  'wl-clipboard: clipboard copy and Ctrl+V paste on Wayland'
  'xdg-utils: opening files and links externally (xdg-open)'
  'kitty: recommended terminal for inline images (kitty graphics protocol)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("https://github.com/methamphetaminelab/gramtty/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums=('96429b71929bbd5a456b48b796d1b5206d9bf2f4f057a61ff3e8e66533e9e026')

package() {
  cd "$_pkgname-$pkgver-x86_64-linux"
  install -Dm755 gramtty -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md README.ru.md -t "$pkgdir/usr/share/doc/$pkgname"
}
