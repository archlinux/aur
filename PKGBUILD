# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libgsignon-glib
pkgver=2.4.0
pkgrel=1
pkgdesc='gSSO client library'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'python')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
source=("git+https://gitlab.com/accounts-sso/libgsignon-glib.git#commit=799c0b9e")
sha256sums=('SKIP')

build() {
  cd libgsignon-glib

  ./autogen.sh \
    --prefix='/usr' \
    --enable-dbus-type='session' \
    --enable-introspection='yes'
  make
}

package() {
  cd libgsignon-glib

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
