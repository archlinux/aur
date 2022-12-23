# Maintainer: Daniels <voiceofwise1 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=group-service
pkgver=1.4.0
pkgrel=1
pkgdesc="Borrowing DBUS services to manage user groups"
arch=('x86_64')
url="https://github.com/zhuyaliang/group-service"
license=('GPL3')
depends=('mate-polkit')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection')
options=(!emptydirs)
source=(https://github.com/zhuyaliang/group-service/archive/$pkgver.tar.gz)
sha256sums=('92bd496e8fcc2e891fa2e871b35575198af72838717bc07221678461ea92b469')

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

