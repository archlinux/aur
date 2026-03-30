# Maintainer: tuanlyphong <tuanphong366@email.com>
pkgname=hyprdict
pkgver=1.0.2
pkgrel=1
pkgdesc="Auto dictionary popup for Hyprland — select a word, get a definition (EN + JP)"
arch=('any')
url="https://github.com/tuanlyphong/hyprdict"
license=('MIT')
depends=('rofi-wayland' 'wl-clipboard' 'curl' 'python' 'libnotify' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tuanlyphong/hyprdict/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ca3ff817190fa2d71c59a5d3daabd8ddaf8d688e8c4a887ec3540fb36edb482')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 dict_toggle.sh "$pkgdir/usr/lib/$pkgname/dict_toggle.sh"
  install -Dm755 dict_watch.sh "$pkgdir/usr/lib/$pkgname/dict_watch.sh"
  install -Dm755 dict_popup.sh "$pkgdir/usr/lib/$pkgname/dict_popup.sh"
  install -Dm644 dict.rasi "$pkgdir/usr/share/$pkgname/dict.rasi"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
