# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>
# Modified 2021-01-18 by Martin Filion <Mordillo98@gmail.com>

pkgname=openbox-menu
pkgver=0.8.0
pkgrel=1
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
license=('GPL3')
depends=('gtk2' 'menu-cache')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("https://sourceforge.net/projects/archbangretro/files//${pkgname}-${pkgver}.tar.xz" "with-svg.patch")
md5sums=('633e2a3d1780e8420ddf0e1d1494d165'
         '484bd49f619e57f9fb2be42931d57dd5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -i ../with-svg.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}/usr/"
}
