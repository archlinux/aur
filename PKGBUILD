# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=xapian-glib
pkgver=3.3.18
pkgrel=2
pkgdesc='GObject bindings for Xapian'
arch=(x86_64)
url='https://github.com/endlessm/xapian-glib'
license=('GPL2')
depends=('xapian-core>=1.3.4' 'glib2>=2.60')
makedepends=('gtk-doc' 'gobject-introspection' 'autoconf')
_builddir="${pkgname}-Release_${pkgver}"

source=("https://github.com/endlessm/${pkgname}/archive/Release_${pkgver}.tar.gz")
sha512sums=('04c6f39c549209490691e2be6733dd64336bdc4fc6ef0b168fa8c16b22d0729c46a8b38c2e677287f45a6d8bfdea371ed1668f99470b8e31dd18056b1e124cd9')

build() {
  cd "$_builddir"
  ./autogen.sh --prefix "$pkgdir/usr"
  make
}

package() {
  cd "$_builddir"
  make install
}

# vim:set ts=2 sw=2 et:
