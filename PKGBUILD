# Maintainer: Gunther Schulz <https://github.com/Gunther-Schulz>
pkgname=ddc-mode-switcher
pkgver=2.1.0
pkgrel=1
pkgdesc="Switch dual-mode monitor display modes via DDC/CI — toggle or Steam wrapper"
arch=('any')
url="https://github.com/Gunther-Schulz/display-mode-switcher"
license=('MIT')
depends=('ddcutil')
optdepends=('mutter: gdctl for res/scale restore on GNOME')
source=("https://github.com/Gunther-Schulz/display-mode-switcher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('75bda330c9ee32f03f4cb37f1947502944ad7ff42900c1f4bf006a83aaf948f7')

package() {
  cd "$srcdir/display-mode-switcher-${pkgver}"
  install -Dm755 ddc-mode-switcher "$pkgdir/usr/bin/ddc-mode-switcher"
  install -Dm644 config.example "$pkgdir/etc/xdg/ddc-mode-switcher/config.example"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
