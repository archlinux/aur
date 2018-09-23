# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
pkgname=gog-baldurs-gate-enhanced-edition
_pkgname=baldurs-gate-enhanced-edition
_original="Baldurs Gate Enhanced Edition"
pkgver=2.5.23121
pkgver_dl=2_5_23121
pkgrel=1
pkgdesc="Chaos threatens to overwhelm the Sword Coast. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/baldurs_gate_enhanced_edition"
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl' 'libjson' 'openal' 'openssl-1.0' 'expat' 'libx11' 'gcc-libs' 'libxext' 'libxcb' 'libxau' 'lib32-libxdmcp')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl' 'lib32-libjson' 'lib32-openal' 'lib32-openssl-1.0' 'lib32-expat' 'lib32-libx11' 'lib32-gcc-libs' 'lib32-libxext' 'lib32-libxcb' 'lib32-libxau' 'lib32-libxdmcp')
optdepends_i686=('libpulse: pulseaudio support')
optdepends_x86_64=('lib32-libpulse: pulseaudio support')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://baldur_s_gate_enhanced_edition_en_$pkgver_dl.sh"
        "${pkgname}"
	"$pkgname.desktop")
PKGEXT=".pkg.tar"
sha256sums=('80ad443563ce65382f1c7c9b8f4b488041449edd7f3bce017ff3eb7cd8250d65'
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
