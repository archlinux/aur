# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
pkgname='citra-nightly'
provides=('citra' 'citra-qt' 'citra-room')
conflicts=('citra-git' 'citra-canary-git' 'citra-canary-bin' 'citra-nightly-bin' 'citra-nightly-git')
pkgver=1597
pkgrel=1
pkgdesc="Citra emulator 'nightly' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-citra-nightly"
license=('GNU General Public License v2.0')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'libzip' 'ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('88b6672f8ab7463c94ddac15d7865ce614ef24feeba0d785f673d80006d50daaad0151cedcdc11472cf9b7ccf05d7f6ec1b09a54d7f3a05afda04100ba1ca58b')

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
