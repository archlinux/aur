# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=adtrack2-bin
pkgver=2.4.24
pkgrel=2
pkgdesc="OPL3 music tracker"
arch=(x86_64)
url="http://www.adlibtracker.net"
license=(custom)
depends=(sdl2)
source=("http://www.adlibtracker.net/files/adtrack-2.4.24-linux-bin-debian-stretch-x86.tar.gz"
        adtrack2.sh
        adtrack2.desktop
        'LICENSE.html::http://www.adlibtracker.net/programfaq.php')
sha256sums=('fdfbb29ae5da944d082a1d33331532745bdfca92acea67eabeae3ff446ec8b17'
            'e8554514c56872d1baf2aceb513249b873e2745eba5448816c06b2a41087603e'
            'c6393a8159cdb8e2de29c82930cb19d5532aa38ab5e4b81d4baf0fac4580fcbf'
            '21dbd102eb17ab90526d03b831d5ec463c8284f75b665766c1dab61697f15f5a')

package() {
  cd "adtrack-$pkgver-linux-bin-debian-stretch-x86"
  install -Dm755 adtrack2 "$pkgdir/usr/share/adtrack2/adtrack2"
  install -Dm755 adtrack2.ini "$pkgdir/usr/share/adtrack2/adtrack2.ini"
  install -Dm755 "$srcdir/adtrack2.sh" "$pkgdir/usr/bin/adtrack2"
  install -Dm644 revision.txt "$pkgdir/usr/share/doc/adtrack2/changelog.txt"
  cp -rv adtrack2.mht instr modules "$pkgdir/usr/share/adtrack2/"
  chmod -R a+rX "$pkgdir/usr/share/adtrack2"
  install -Dm644 adtrack2.png "$pkgdir/usr/share/pixmaps/adtrack2.png"
  install -Dm644 "$srcdir/adtrack2.desktop" \
    "$pkgdir/usr/share/applications/adtrack2.desktop"
  install -Dm644 "$srcdir/LICENSE.html" "$pkgdir/usr/share/licenses/adtrack2/LICENSE.html"
}
