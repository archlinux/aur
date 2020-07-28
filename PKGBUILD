# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
pkgname='citra-nightly'
provides=('citra' 'citra-qt' 'citra-room')
conflicts=('citra-git' 'citra-canary-git' 'citra-canary-bin' 'citra-nightly-bin' 'citra-nightly-git')
pkgver=1598
pkgrel=1
pkgdesc="Citra emulator 'nightly' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-citra-nightly"
license=('GNU General Public License v2.0')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'libzip' 'ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('858cd594a5066c2ea65cb780fe3740ddc500425a37a7dacc91ad2ad9d5a0dac0952eb26cc0af3dfe49a4597b3f3b58cdc61f1edc72926ffa6ee280272aadb79b')

package() {
  cd "${srcdir}/arch-${pkgname}-${pkgver}"
  
  mkdir -p $pkgdir/usr/bin
  mv citra $pkgdir/usr/bin/
  mv citra-qt $pkgdir/usr/bin/ 
  mv citra-room $pkgdir/usr/bin/ 

  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mv citra.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
 
  mkdir -p $pkgdir/usr/share/applications
  mv citra.desktop $pkgdir/usr/share/applications/
}
