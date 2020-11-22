# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
pkgname='citra-nightly'
provides=('citra' 'citra-qt' 'citra-room')
conflicts=('citra-git' 'citra-canary-git' 'citra-canary-bin' 'citra-nightly-bin' 'citra-nightly-git')
pkgver=1645
pkgrel=1
pkgdesc="Citra emulator 'nightly' branch binaries for Arch Linux"
arch=('x86_64')
url="https://github.com/linux-gamers/arch-citra-nightly"
license=('GNU General Public License v2.0')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'libzip' 'ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('f3ac73cd533292a1d4c9dec10ab6f5bfb1455996a5ca79da5893a81ee06233e21ad09be29aa9cf042b42efd21625164bc8960340934f590c2a499cd91dc34495')

package() {
  cd "${srcdir}/arch-${pkgname}-${pkgver}"
  
  mkdir -p $pkgdir/usr/bin
  mv dist/citra $pkgdir/usr/bin/
  mv dist/citra-qt $pkgdir/usr/bin/ 
  mv dist/citra-room $pkgdir/usr/bin/ 

  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mv dist/citra.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
 
  mkdir -p $pkgdir/usr/share/applications
  mv dist/citra.desktop $pkgdir/usr/share/applications/
}
