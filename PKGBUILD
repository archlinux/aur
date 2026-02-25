# Maintainer: Nika Tsutskiridze

pkgname=alarm-notify
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple timer notifications with sound and custom messages"
arch=('any')
url="https://github.com/nikaakin/alarm-notify" 
license=('MIT')
depends=('bash' 'libnotify' 'alsa-utils')
optdepends=(
  'gnome-terminal: external terminal support'
  'alacritty: external terminal support'
  'konsole: external terminal support'
  'xfce4-terminal: external terminal support'
  'xterm: external terminal support'
  'ghostty: external terminal support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikaakin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 alarm-notify-linux "$pkgdir/usr/bin/alarm-notify"
  install -Dm644 alarm-notify.png "$pkgdir/usr/share/alarm-notify/alarm-notify.png"
  install -Dm644 alarm-notify.wav "$pkgdir/usr/share/alarm-notify/alarm-notify.wav"
  install -Dm644 README.md "$pkgdir/usr/share/doc/alarm-notify/README.md"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/alarm-notify/LICENCE"
}
