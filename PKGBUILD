# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
_pkgname=yuzu-mainline
pkgname="${_pkgname}-bin"
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
_pkgver=316
pkgver="0.${_pkgver}"
pkgrel=1
pkgdesc="Yuzu emulator 'mainline' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-yuzu-mainline"
license=('GNU General Public License v2.0')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'fmt')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/archive/0-${_pkgver}.tar.gz")
sha512sums=('3fb8655167536a57a275fd5723a992bcd2e3852af50e42a6aed53c09cd871b6a617250e588dca00548cd60d501373b789eed51af1e688b0048b2623ac6a9a0ec')

package() {
  cd "${srcdir}/arch-${_pkgname}-0-${_pkgver}"
  
  mkdir -p $pkgdir/usr/bin
  mv yuzu $pkgdir/usr/bin/
  mv yuzu-cmd $pkgdir/usr/bin/ 

  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mv yuzu.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
 
  mkdir -p $pkgdir/usr/share/applications
  mv yuzu.desktop $pkgdir/usr/share/applications/
}