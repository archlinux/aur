#Maintainer: Erwin-Iosef erwiniosef@gmail.com
#PKGBUILD stolen from https://aur.archlinux.org/pkgbase/papirus-icon-theme-git(Thanks!)

pkgbase=papirus-icon-theme-plasma-fork
pkgname=('papirus-icon-theme-plasma-fork-git')
pkgrel=1
pkgver=git
pkgdesc="Custom fork for Plasma to use Breeze colourable icons with the non-recolourable Papirus ones removed and added missing icons. Use at your own risk."
arch=('any')
url="https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git"
license=("GPL-3.0-or-later")
depends=('gtk-update-icon-cache')
makedepends=('git')
source=("git+https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git")
options+=(!strip)
sha256sums=('SKIP')

package_papirus-icon-theme-plasma-fork-git() {
  optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
              'hardcode-tray-git: To fix hardcoded tray icons'
              'sif-git: To fix icons of running Steam games')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
 
  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
  echo "POSTINSTALL: Remember to clean your sources to free space!"
}
