# Maintainer: tuanlyphong <tuanphong366@email.com>
pkgname=hyprdict
pkgver=1.0.8
pkgrel=1
pkgdesc="Auto dictionary popup for Hyprland — select a word, get a definition (EN + JP)"
arch=('any')
url="https://github.com/tuanlyphong/hyprdict"
license=('MIT')
depends=('rofi-wayland' 'wl-clipboard' 'curl' 'python' 'libnotify' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tuanlyphong/hyprdict/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d4d46741d9ee86b7ac9a3f0a0664f63ec8fc3a436434ac08af868cc254543d4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 dict_toggle.sh "$pkgdir/usr/bin/hyprdict-toggle"
  install -Dm755 dict_watch.sh "$pkgdir/usr/bin/hyprdict-watch"
  install -Dm755 dict_popup.sh "$pkgdir/usr/bin/hyprdict-popup"
  install -Dm644 dict.rasi "$pkgdir/usr/share/$pkgname/dict.rasi"
}
