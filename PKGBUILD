# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=group-service 
pkgver=1.1.0
pkgrel=3
pkgdesc="Borrowing DBUS services to manage user groups "
arch=('x86_64')
url="https://github.com/zhuyaliang/group-service"
license=('GPL3')
depends=('mate-polkit')
makedepends=('gettext' 'itstool' 'vala' 'meson-git' 'ninja' 'gobject-introspection')
options=(!emptydirs)
source=(https://github.com/zhuyaliang/group-service/archive/$pkgver.tar.gz)
sha256sums=('bcff2f4744db1ffbae3973733acd80586b9c697b44c06e478cf12ef80b22ac6e')

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


