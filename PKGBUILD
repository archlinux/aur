# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=group-service 
pkgver=1.3.0
pkgrel=1
pkgdesc="Borrowing DBUS services to manage user groups"
arch=('x86_64')
url="https://github.com/zhuyaliang/group-service"
license=('GPL3')
depends=('mate-polkit')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection')
options=(!emptydirs)
source=(https://github.com/zhuyaliang/group-service/archive/$pkgver.tar.gz)
sha256sums=('4ae8be84b90ebf350f24a2bddfa0ac2a167c42304ba0bae4260ad516066157b1')

build() {
  cd $pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr
  ninja 
}

package() {
  cd $pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:


