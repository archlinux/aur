# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
pkgname='citra-nightly'
provides=('citra' 'citra-qt' 'citra-room')
conflicts=('citra-git' 'citra-canary-git' 'citra-canary-bin' 'citra-nightly-bin' 'citra-nightly-git')
pkgver=1673
pkgrel=1
pkgdesc="Citra emulator 'nightly' branch binaries for Arch Linux"
arch=('x86_64')
url="https://github.com/linux-gamers/arch-citra-nightly"
license=('GNU General Public License v2.0')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'libzip' 'ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('08081889828db128072729b5fe11dbb3d6fea713fa44540628e9af7c9703ba577225ca05b6e19057bfeab6fb0c0532c5d0b8ce966e2eb3c9fa5b43416cd8c689')

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
