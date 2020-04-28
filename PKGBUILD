# Maintainer: 5anya <sanya at national dot shitposting dot agency>
# Contributor: Luke Chen <doomer at yahoo dot com>
pkgname=gog-crypt-of-the-necrodancer-amplified
_pkgname=crypt-of-the-necrodancer-amplified
epoch=1
pkgver=1.29.14917
_pkgver=1_29_14917
_dlcver=2_59_21255
pkgrel=1.1
pkgdesc="A roguelike rhythm game! (with the Amplified DLC)"
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
            '070ec64e6d5bc1a4b68e73fd25a716b116b279718b338f071f0bea953532d4ff'
            '1542f20660e4bf1fc78a35759a71d6d658d3b80279fe5223fc0d60f25d309f0e'
            'bf6f3b593bfeef411cc0ff660bd2f469a41b14e1b5b4176f748cc70bf58a64e4')
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
