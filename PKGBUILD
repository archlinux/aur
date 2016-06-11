# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
pkgname=gog-baldurs-gate-enhanced-edition
_pkgname=baldurs-gate-enhanced-edition
_original="Baldurs Gate Enhanced Edition"
pkgver=2.4.0.6
pkgrel=1
pkgdesc="Chaos threatens to overwhelm the Sword Coast. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/baldurs_gate_enhanced_edition"
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl')
optdepends_i686=('libpulse: pulseaudio support')
optdepends_x86_64=('lib32-libpulse: pulseaudio support')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://gog_baldur_s_gate_enhanced_edition_$pkgver.sh"
        "${pkgname}"
	"$pkgname.desktop")
PKGEXT=".pkg.tar"
sha256sums=('de857797af2c1b0df589425c60a36fb956ee9322c96f2535eb52b98d0ae5ee5b'
            '7b037776cb5a87c26a827ef29bd87957d0fee670570a6f9e0383ec2d90f26040'
            'a1b677747360e37376da85ccc568463f9c0cb0d8a99a8e0be3655bf23473ccb7')
package() {
  _pkgdir="$pkgdir/opt/gog/$_pkgname"
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$_pkgdir"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
