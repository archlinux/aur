# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>

pkgname=openbox-menu
pkgver=0.7.0
pkgrel=1
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://mimasgpc.free.fr/openbox-menu.html"
license=('GPL3')
depends=('gtk2' 'menu-cache')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("https://bitbucket.org/fabriceT/openbox-menu/downloads/${pkgname}-${pkgver}.tar.bz2" "with-svg.patch")
md5sums=('bd7e746452931e48340788c9e8ececa4'
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
