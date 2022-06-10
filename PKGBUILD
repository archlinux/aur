# Maintainer: renyuneyun <renyuneyun@gmail.com>

pkgname=linux-dynamic-wallpapers-git
_srcname=Linux_Dynamic_Wallpapers
pkgver=r407.aec7d27
pkgrel=1
pkgdesc="Dynamic Wallpapers for Linux (Gnome). Note: this project is named Linux_Dynamic_Wallpapers, but is meant to support Gnome's dynamic wallpapers (and maybe related DEs)."
arch=('x86_64')
url="https://github.com/saint-13/Linux_Dynamic_Wallpapers"
license=(unknown)
depends=()
makedepends=(git)
source=("git+https://github.com/saint-13/Linux_Dynamic_Wallpapers.git")
md5sums=('SKIP')

pkgver() {
  cd ${_srcname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/$_srcname
  mkdir -p ${pkgdir}/usr/share/backgrounds/
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties/
  cp -r $(pwd)/Dynamic_Wallpapers ${pkgdir}/usr/share/backgrounds/Dynamic_Wallpapers
  cp -r $(pwd)/xml/* ${pkgdir}/usr/share/gnome-background-properties/
}
