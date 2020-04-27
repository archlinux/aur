# Maintainer: 5anya <sanya at national dot shitposting dot agency>
# Contributor: Luke Chen <doomer at yahoo dot com>
pkgname=gog-crypt-of-the-necrodancer-amplified
_pkgname=crypt-of-the-necrodancer
epoch=1
pkgver=1.29.14917
_pkgver=1_29_14917
_dlcver=2_59_21255
pkgrel=1
pkgdesc="A roguelike rhythm game! (with the Amplified DLC)"
conflicts=('gog-crypt-of-the-necrodancer')
arch=('i686' 'x86_64')
license=('custom')
install=${pkgname}.install
source=("local://crypt_of_the_necrodancer_en_${_pkgver}.sh"
	"local://crypt_of_the_necrodancer_amplified_dlc_en_${_dlcver}.sh"
	"$pkgname"
	"$pkgname.desktop"
	"$pkgname.install")
sha256sums=(SKIP
            SKIP
	    'd80562a04ded4b25bca9738267d1d93d2be8fef74570aa7d00d83471c4e71121'
	    '9753ea711a428a24333cb37be1f11a3a35860072723e89dd7599d1842f0f4f89'
            '99136db3939cbab2ae33181479e069c3d25298096758327a41d002494c8ae54c')
PKGEXT=".pkg.tar"

package() {
  depends_i686=('libglvnd' 'openal' 'libxrandr' 'libpulse')
  depends_x86_64=('lib32-libglvnd' 'lib32-openal' 'lib32-libxrandr' 'lib32-libpulse')
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$pkgdir"/opt/gog/$_pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
