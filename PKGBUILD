# Maintainer: Daniels <voiceofwise1 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=user-admin
pkgver=1.7.0
pkgrel=1
pkgdesc="Mate-Desktop user management tool"
arch=('x86_64')
url="https://github.com/zhuyaliang/user-admin"
license=('GPL3')
depends=('group-service' 'accountsservice' 'libpwquality' 'mate-desktop')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' )
options=(!emptydirs)
source=(https://github.com/zhuyaliang/user-admin/archive/v$pkgver.tar.gz)
sha256sums=('b4eb0783b382ed9405c76b765148d105dd113e20f66e61ad63d6fb7de7cafe1d')

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

