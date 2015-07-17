# Maintainer: thr <r at sledinmay dot com>
pkgname=grotz
pkgver=0.2c
pkgrel=5
pkgdesc="A Z-code interactive fiction interpreter for GTK."
arch=(i686 x86_64)
url=http://kevinboone.net/README_grotz.html
license=(GPL)
depends=(gtk2 mplayer)
source=("http://kevinboone.net/grotz2.tar.gz")
install=grotz.install
md5sums=('8cc05bef45467643e15a8624aa0e49a3')

build() {
  cd grotz2
  make bundle
}
package() {
  install -D grotz2/grotz ${pkgdir}/usr/bin/grotz
  install -D grotz2/scripts/grotz_playmedia.sh ${pkgdir}/usr/bin/grotz_playmedia.sh
  install -D -m644 grotz2/icons/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -D -m644 grotz2/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
