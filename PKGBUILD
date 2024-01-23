# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>
# Last Modified 2023-01-23 by Martin Filion <Mordillo98@gmail.com>

pkgname=openbox-menu
pkgver=0.8.0
pkgrel=1
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
license=('GPL3')
depends=('gtk2' 'menu-cache')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("git+https://github.com/fabriceT/openbox-menu" "with-svg.patch")
md5sums=('SKIP'
         '484bd49f619e57f9fb2be42931d57dd5')

build() {
  cd "${srcdir}/${pkgname}"
  patch -i ../with-svg.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}/usr/"
}
