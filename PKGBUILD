# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=user-admin 
pkgver=1.4.2
pkgrel=1
pkgdesc="Mate-Desktop user management tool"
arch=('x86_64')
url="https://github.com/zhuyaliang/user-admin"
license=('GPL3')
depends=('group-service' 'accountsservice' 'libpwquality' 'mate-desktop')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' )
options=(!emptydirs)
source=(https://github.com/zhuyaliang/user-admin/archive/$pkgver.tar.gz)
sha256sums=('acb074dce37ee597f4d490802ebb69600ca2e697245d941f5cc65592251472d4')

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


