# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=group-service 
pkgver=1.2.0
pkgrel=1
pkgdesc="Borrowing DBUS services to manage user groups"
arch=('x86_64')
url="https://github.com/zhuyaliang/group-service"
license=('GPL3')
depends=('mate-polkit')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection')
options=(!emptydirs)
source=(https://github.com/zhuyaliang/group-service/archive/$pkgver.tar.gz)
sha256sums=('cd84741acf66f08c061911dd59bbbdbe46016bd7fc48cada08f389ce139cf423')

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


