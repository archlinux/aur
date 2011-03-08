# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.6.8
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gdk-pixbuf2' 'json-glib' 'atk' 'pango' 'mesa' 'libxcomposite' 'libxi')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('cc147b8e7e62ed4b9b8a83df3db9788cf37db0c83970ba876228433f32bda442')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
