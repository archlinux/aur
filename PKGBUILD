#Maintainer: Erwin-Iosef erwiniosef@gmail.com
#PKGBUILD stolen from https://aur.archlinux.org/pkgbase/papirus-icon-theme-git(Thanks!)
#NOTE: First time AUR package, do not install.
pkgname=('papirus-icon-theme-plasma-fork-git')
pkgver=20250114
pkgrel=2
pkgdesc="Custom fork for Plasma to use Breeze colourable icons with the non-recolourable Papirus ones removed and added missing icons. Use at your own risk."
arch=('any')
url="https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git"
license=("GPL-3.0-or-later")
depends=('gtk-update-icon-cache')
optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
            'hardcode-tray-git: To fix hardcoded tray icons'
            'sif-git: To fix icons of running Steam games')
makedepends=('git')
source=("git+https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git")
options+=(!strip)
provides=('papirus-icon-theme')
conflicts=('papirus-icon-theme')
sha256sums=('SKIP')

package(){
  cd "$srcdir/${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
}
