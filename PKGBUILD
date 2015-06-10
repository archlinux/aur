# Maintainer: DenSpirit <elfmax@tut.by>
# partially stolen from simutrans-pak64 in [community]
pkgname=simutrans-pakhd
pkgver=0.4
pkgrel=1
pkgdesc="Handdrawn imageset for Simutrans"
url="http://hd.simutrans.com/"
arch=('any')
license=('PerlArtistic')
options=('!strip')
source=("http://hd.simutrans.com/release/PakHD_v04B_100-0.zip"
        "http://hd.simutrans.com/release/pakHD_v04B_menuconf.zip")

prepare() {
  cd "$srcdir"
  cp config pakHD/ -rf
}
package() {
  cd "$srcdir"
  chmod -R 644 pakHD

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r pakHD "$pkgdir/usr/share/games/simutrans"

  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;

  }

# vim:set ts=2 sw=2 et:
md5sums=('0d8cee7da9720e8758830827f7a71407'
         'aa227de7fbe97c97dee129d983fb6e04')
