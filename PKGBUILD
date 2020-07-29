# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
pkgname='citra-nightly'
provides=('citra' 'citra-qt' 'citra-room')
conflicts=('citra-git' 'citra-canary-git' 'citra-canary-bin' 'citra-nightly-bin' 'citra-nightly-git')
pkgver=1599
pkgrel=1
pkgdesc="Citra emulator 'nightly' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-citra-nightly"
license=('GNU General Public License v2.0')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'libzip' 'ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('eb3487fd8f3f28fdd67067b08901fe057fe4b9c7513d7d928a338c4c024cf3a4e4181c0ac1ee9cc6c78b602450b8a33186c3d3c91904a1dfd21039e2df2bd2b8')

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
