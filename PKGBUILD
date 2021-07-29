# Maintainer: Christoph Schmidpeter <christoph dot schmidpeter at gmx dot de>
# Contributor: Philippe Cherel <philippe dot cherel at mayenne dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=gog-baldurs-gate-2-enhanced-edition
_pkgname=baldurs-gate-2-enhanced-edition
_original="Baldurs Gate 2 Enhanced Edition"
pkgver=2.6.6.0.47292
pkgver_dl=2_6_6_0_47292
pkgrel=1
pkgdesc="Your story begins anew in the exotic southern kingdom of Amn, amidst the opulence of the sinister capital city of Athkatla. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/baldurs_gate_2_enhanced_edition"
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl' 'libjson' 'openal' 'openssl-1.0' 'expat' 'libx11' 'gcc-libs' 'libxext' 'libxcb' 'libxau' 'lib32-libxdmcp')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl' 'lib32-libjson' 'lib32-openal' 'lib32-openssl-1.0' 'lib32-expat' 'lib32-libx11' 'lib32-gcc-libs' 'lib32-libxext' 'lib32-libxcb' 'lib32-libxau' 'lib32-libxdmcp')
optdepends_i686=('libpulse: pulseaudio support')
optdepends_x86_64=('lib32-libpulse: pulseaudio support')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://baldur_s_gate_ii_enhanced_edition_$pkgver_dl.sh"
        "${pkgname}"
        "$pkgname.desktop")
PKGEXT=".pkg.tar"
sha256sums=('453b22cc00a3a412dae8a73dcf89b07ef066c89b4c17cc70cf5f49c8d224bc6f'
            'd88a1751e522096976be38ef27b841af533d11155ab0c507d83836818229f918'
            'a5e36a1bcd664d34e1b01cedad249282b5a7663f1bdae73242966231c5250644')
package() {
  _pkgdir="$pkgdir/opt/gog/$_pkgname"
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$_pkgdir"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
