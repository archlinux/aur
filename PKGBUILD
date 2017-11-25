# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>

pkgname=openbox-menu
pkgver=0.8.0
pkgrel=1
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
license=('GPL3')
depends=('gtk2' 'menu-cache')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("https://bitbucket.org/fabriceT/openbox-menu/downloads/${pkgname}-${pkgver}.tar.bz2" "with-svg.patch")
md5sums=('0d6f907adf2d47dd4d4198c0ff14721d'
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
