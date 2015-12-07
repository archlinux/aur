# Maintainer: Luke Chen <doomer at yahoo dot com>
pkgname=gog-crypt-of-the-necrodancer
_pkgname=crypt-of-the-necrodancer
pkgver=2.1.0.3
pkgrel=1
pkgdesc="A roguelike rhythm game! Move on the beat to navigate ever changing dungeons"
arch=('i686' 'x86_64')
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl')
optdepends_i686=()
optdepends_x86_64=()
install=${pkgname}.install
source=("local://gog_crypt_of_the_necrodancer_${pkgver}.sh"
	"$pkgname"
	"$pkgname.desktop")
sha256sums=(SKIP
	    'd80562a04ded4b25bca9738267d1d93d2be8fef74570aa7d00d83471c4e71121'
	    '9753ea711a428a24333cb37be1f11a3a35860072723e89dd7599d1842f0f4f89')

package() {
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$pkgdir"/opt/gog/$_pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
