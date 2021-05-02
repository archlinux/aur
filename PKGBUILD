# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=user-admin 
pkgver=1.6.0
pkgrel=1
pkgdesc="Mate-Desktop user management tool"
arch=('x86_64')
url="https://github.com/zhuyaliang/user-admin"
license=('GPL3')
depends=('group-service' 'accountsservice' 'libpwquality' 'mate-desktop')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' )
options=(!emptydirs)
source=(https://github.com/zhuyaliang/user-admin/archive/$pkgver.tar.gz)
sha256sums=('305f2ea548c2eca4af741ee8cfeaa5ded7dac3b29f9a731f884abad00b7600c5')

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


