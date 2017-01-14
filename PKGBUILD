# Maintainer: Luke Chen <doomer at yahoo dot com>
pkgname=gog-slain-back-from-hell
_pkgname=slain-back-from-hell
pkgver=2.2.0.3
pkgrel=1
pkgdesc="You control the fate of Bathoryn, a doomed hero in a Gothic world, who seeks to liberate six cursed realms from six deadly overlords."
arch=('x86_64')
license=('custom')
depends_x86_64=('lib32-libgl')
optdepends_x86_64=()
install=${pkgname}.install
source=("local://gog_slain_back_from_hell_${pkgver}.sh"
	"$pkgname"
	"$pkgname.desktop")
sha256sums=(SKIP
	    '21b51d22142c31ef5f10de55ac774a47055473a0cbf1724dfec2b946dab2fb4e'
	    '76e6dbb9e45fb113b72a3fc190bfa3099ce8d721efa3cf6b2a33c01a9f2a6193')

package() {
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$pkgdir"/opt/gog/$_pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
