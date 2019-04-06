# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=user-admin 
pkgver=1.4.1
pkgrel=1
pkgdesc="Mate-Desktop user management tool"
arch=('x86_64')
url="https://github.com/zhuyaliang/user-admin"
license=('GPL3')
depends=('mate-polkit' 'group-service')
makedepends=('gettext' 'itstool' 'vala' 'meson-git' 'ninja' 'gobject-introspection' 'accountsservice')
options=(!emptydirs)
source=(https://github.com/zhuyaliang/user-admin/archive/$pkgver.tar.gz)
sha256sums=('380146cbb09a5dc4940290dfeee99e1b604ca320a231042b2f09d3672851ff1c')

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


