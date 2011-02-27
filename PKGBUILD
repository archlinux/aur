# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.6.6
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gdk-pixbuf2' 'json-glib' 'atk' 'pango' 'mesa' 'libxcomposite' 'libxi')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('8499fef3019c00bb06354ebe6d3277d26c84a8aa1d964b7edf6d327cd4d9d886')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
