# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
_pkgname=yuzu-mainline
pkgname="${_pkgname}-bin"
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
_pkgver=447
pkgver="0.${_pkgver}"
pkgrel=1
pkgdesc="Yuzu emulator 'mainline' branch binaries for Arch Linux"
arch=('x86_64')
url="https://github.com/linux-gamers/arch-yuzu-mainline"
license=('GNU General Public License v2.0')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'qt5-webengine' 'libxkbcommon-x11' 'libfdk-aac' 'fmt' 'libzip')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/archive/0-${_pkgver}.tar.gz")
sha512sums=('49bf0dc1540730ba8ece255101d244048817e20746b1802da4294725acf9e2ec7fafa2a0c12f5d905fa5b9e64f9abdf33a1d0efb2f1336ea7f0165285baf24df')

package() {
  cd "${srcdir}/arch-${_pkgname}-0-${_pkgver}"
  
  mkdir -p $pkgdir/usr/bin
  mv dist/yuzu $pkgdir/usr/bin/
  mv dist/yuzu-cmd $pkgdir/usr/bin/ 

  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mv dist/yuzu.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
 
  mkdir -p $pkgdir/usr/share/applications
  mv dist/yuzu.desktop $pkgdir/usr/share/applications/
}