# Maintainer: tuanlyphong <tuanphong366@email.com>
pkgname=hyprdict
pkgver=1.0.3
pkgrel=1
pkgdesc="Auto dictionary popup for Hyprland — select a word, get a definition (EN + JP)"
arch=('any')
url="https://github.com/tuanlyphong/hyprdict"
license=('MIT')
depends=('rofi-wayland' 'wl-clipboard' 'curl' 'python' 'libnotify' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tuanlyphong/hyprdict/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc4c0dd486268d7b71b6973ad7e93a8cc033fdbd1d6d3452fcde690fe60a6d67')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 dict_toggle.sh "$pkgdir/usr/lib/$pkgname/dict_toggle.sh"
  install -Dm755 dict_watch.sh "$pkgdir/usr/lib/$pkgname/dict_watch.sh"
  install -Dm755 dict_popup.sh "$pkgdir/usr/lib/$pkgname/dict_popup.sh"
  install -Dm644 dict.rasi "$pkgdir/usr/share/$pkgname/dict.rasi"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
