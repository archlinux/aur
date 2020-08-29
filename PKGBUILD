# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
_pkgname=yuzu-mainline
pkgname="${_pkgname}-bin"
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
_pkgver=362
pkgver="0.${_pkgver}"
pkgrel=1
pkgdesc="Yuzu emulator 'mainline' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-yuzu-mainline"
license=('GNU General Public License v2.0')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'fmt' 'libzip')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/archive/0-${_pkgver}.tar.gz")
sha512sums=('862c2ed3593297dba66e2852550d512648768554a459526be68f0585226f75f2222954d93a50f4fb534dcb8721f1d027028ee98480b5c2fe6dbe88314034f9a6')

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