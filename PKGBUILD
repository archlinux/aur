# Maintainer: Nathan Fisher <nfisher dot sr gmail com>

pkgname=pekwm-menu
pkgver=0.5.0
pkgrel=1
pkgdesc="Dynamic xdg menu creator for pekwm"
url="https://bitbucket.org/nfisher1226/pekwm-menu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('menu-cache' 'gtk2')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
conflicts=('pekwm-menu-hg')
provides=('pekwm-menu')
source=https://bitbucket.org/nfisher1226/pekwm-menu/downloads/pekwm-menu-0.5.0.tar.gz
sha256sums=('26e3a6b4f6508529fed5f27a3de340b7cefc322249f7378202f6de3524da413f')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}/usr/"
}
