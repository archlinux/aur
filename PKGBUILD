# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=widgie-menu-compat
pkgver=1.0
pkgrel=0
pkgdesc="Compatibility layer to use widgie-menu as a replacement of bemenu and dmenu"
arch=('any')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
depends=('widgie')
provides=('dmenu' 'bemenu')
conflicts=('dmenu' 'bemenu' 'bemenu-ncurses' 'bemenu-wayland' 'bemenu-wlroots' 'bemenu-x11')
source=("widgie-menu-path")
sha256sums=('ce4cfb2c3c858228106de03a35bff4f0260a8a9174e39d307f73a5dc84e1b339')

package() {
  install -d "$pkgdir"/usr/bin
  install -m 755 widgie-menu-path "$pkgdir"/usr/bin/dmenu_path
  ln -s "/usr/bin/widgie-menu" "$pkgdir"/usr/bin/dmenu
  ln -s "/usr/bin/widgie-menu-run" "$pkgdir"/usr/bin/dmenu_run

  ln -s "/usr/bin/widgie-menu" "$pkgdir"/usr/bin/bemenu
  ln -s "/usr/bin/widgie-menu-run" "$pkgdir"/usr/bin/bemenu-run
}
