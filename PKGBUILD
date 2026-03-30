# Maintainer: tuanlyphong <tuanphong366@email.com>
pkgname=hyprdict
pkgver=1.0.1
pkgrel=1
pkgdesc="Auto dictionary popup for Hyprland — select a word, get a definition (EN + JP)"
arch=('any')
url="https://github.com/tuanlyphong/hyprdict"
license=('MIT')
depends=('rofi-wayland' 'wl-clipboard' 'curl' 'python' 'libnotify' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tuanlyphong/hyprdict/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58704caed4d142b03b5db2bc33ac86d661d91fa48c4298f36e3732f9f5c5ce4e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 dict_toggle.sh "$pkgdir/usr/lib/$pkgname/dict_toggle.sh"
  install -Dm755 dict_watch.sh "$pkgdir/usr/lib/$pkgname/dict_watch.sh"
  install -Dm755 dict_popup.sh "$pkgdir/usr/lib/$pkgname/dict_popup.sh"
  install -Dm644 dict.rasi "$pkgdir/usr/share/$pkgname/dict.rasi"
}
