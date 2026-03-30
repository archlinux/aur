# Maintainer: tuanlyphong <tuanphong366@email.com>
pkgname=hyprdict
pkgver=1.0.5
pkgrel=1
pkgdesc="Auto dictionary popup for Hyprland — select a word, get a definition (EN + JP)"
arch=('any')
url="https://github.com/tuanlyphong/hyprdict"
license=('MIT')
depends=('rofi-wayland' 'wl-clipboard' 'curl' 'python' 'libnotify' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tuanlyphong/hyprdict/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29aaff3cdad7ab4ecb0011d06a874f6c74981b1c6b7b29663eff59f4c0d13c3b')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 dict_toggle.sh "$pkgdir/usr/bin/hyprdict-toggle"
  install -Dm755 dict_watch.sh "$pkgdir/usr/bin/hyprdict-watch"
  install -Dm755 dict_popup.sh "$pkgdir/usr/bin/hyprdict-popup"
  install -Dm644 dict.rasi "$pkgdir/usr/share/$pkgname/dict.rasi"
}
