# Maintainer: Gunther Schulz <https://github.com/Gunther-Schulz>
pkgname=ddc-mode-switcher
pkgver=2.3.0
pkgrel=1
pkgdesc="Switch dual-mode monitor display modes via DDC/CI — toggle or Steam wrapper"
arch=('any')
url="https://github.com/Gunther-Schulz/ddc-mode-switcher"
license=('MIT')
depends=('ddcutil')
optdepends=('mutter: gdctl for res/scale restore on GNOME'
            'libnotify: desktop notifications on error')
source=("https://github.com/Gunther-Schulz/ddc-mode-switcher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('edc125b3e5ffa5e061a7503e9d9e9f3fc0e15608822d981ae36fbaef43f67d41')

package() {
  cd "$srcdir/ddc-mode-switcher-${pkgver}"
  install -Dm755 ddc-mode-switcher "$pkgdir/usr/bin/ddc-mode-switcher"
  install -Dm644 config.example "$pkgdir/etc/xdg/ddc-mode-switcher/config.example"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
