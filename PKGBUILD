# Maintainer: Pablo Lezaeta <prflr88@gmai.com>

pkgname=fluxdgmenu
pkgver=1.7.3.r108
pkgrel=1
pkgdesc="Fluxdgmenu is an automated XDG Menu system for Fluxbox."
arch=("i686" "x86_64")
url="https://github.com/shimmerproject/Albatross"
license=("GPL")
depends=("inotify-tools" "python2-xdg" "fluxbox")
makedepends=("git")
provides=("fluxdgmenu" "fluxdgmenu-git")
conflicts=("fluxdgmenu-git")
optdepends=("python2-gtk2: enables fluxdgmenu to use your current GTK icon theme"
	"python2-gmenu: makes menu generation 10 times faster..."
	"python2-gobject: enables the recently used files menu to display item icons according to their mime type."
	"zenity: enables fluxdgmenu to display progressbars during menu generation.")
source=("Fluxdgmenu::git+https://github.com/ju1ius/fluxdgmenu.git")
md5sums=("SKIP")

pkgver() {
  cd "Fluxdgmenu"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

build() {
  cd "${srcdir}/Fluxdgmenu"

  make
}

package() {
  cd "${srcdir}/Fluxdgmenu"

  make DESTDIR="${pkgdir}" install
}
