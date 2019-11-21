# vim: set ts=2 sw=2 et:
# Maintainer: Patrick Wicki <patrick.wicki96gmail.com>

pkgname=mwb-layout
pkgver=r24.244ca13
pkgrel=2
pkgdesc='Optimized keyboard layout, based on programmer dvorak and with a 3rd layer'
arch=(any)
url="https://github.com/MatteoWickiBande/mwb-layout"
source=("git+$url.git")
license=(GPL3)
depends=(git)
optdepends=('xcape: swap for swapping CAPS with escape')
md5sums=('SKIP')
install='mwb-layout.install'

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  gzip -c mwb.map > mwb.map.gz
  install -Dm 644 mwb.map.gz "$pkgdir/usr/share/kbd/keymaps/i386/dvorak/mwb.map.gz"
  install -Dm 644 mwb "$pkgdir/usr/share/X11/xkb/symbols/mwb"
}
