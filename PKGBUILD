# Maintainer: thr <r at sledinmay dot com>
pkgname=grotz
pkgver=0.2c
pkgrel=6
pkgdesc="A Z-code interactive fiction interpreter for GTK."
arch=(i686 x86_64)
url=https://github.com/kevinboone/grotz
license=(GPL)
depends=(gtk2 mplayer)
source=("git+$url")
install=grotz.install
md5sums=('SKIP')

build() {
  cd grotz
  make bundle
}
package() {
  install -D grotz/grotz ${pkgdir}/usr/bin/grotz
  install -D grotz/scripts/grotz_playmedia.sh ${pkgdir}/usr/bin/grotz_playmedia.sh
  install -D -m644 grotz/icons/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -D -m644 grotz/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
