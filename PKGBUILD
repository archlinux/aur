# Maintainer: Gunther Schulz <https://github.com/Gunther-Schulz>
pkgname=ddc-mode-switcher
pkgver=2.0.2
pkgrel=1
pkgdesc="Switch dual-mode monitor display modes via DDC/CI — toggle or Steam wrapper"
arch=('any')
url="https://github.com/Gunther-Schulz/display-mode-switcher"
license=('MIT')
depends=('ddcutil')
optdepends=('mutter: gdctl for res/scale restore on GNOME')
source=("https://github.com/Gunther-Schulz/display-mode-switcher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc14e45758a877faa9bd2dbe318321d19482ceddc2c2c4deb197e709e8c9a9da')

package() {
  cd "$srcdir/display-mode-switcher-${pkgver}"
  install -Dm755 ddc-mode-switcher "$pkgdir/usr/bin/ddc-mode-switcher"
  install -Dm644 config.example "$pkgdir/etc/xdg/ddc-mode-switcher/config.example"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
