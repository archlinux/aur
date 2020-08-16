# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
_pkgname=yuzu-mainline
pkgname="${_pkgname}-bin"
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
_pkgver=349
pkgver="0.${_pkgver}"
pkgrel=1
pkgdesc="Yuzu emulator 'mainline' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-yuzu-mainline"
license=('GNU General Public License v2.0')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'fmt' 'libzip')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/archive/0-${_pkgver}.tar.gz")
sha512sums=('ab53b085bdea084674d65939741704e9b4d5e17a664650cc06c07f7abcbc5cf573400a0afb40667a7025da661b83a473108fb1ad81603b159ca9578760e3cbf8')

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