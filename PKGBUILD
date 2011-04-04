# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.6.12
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gdk-pixbuf2' 'json-glib' 'atk' 'pango' 'mesa' 'libxcomposite' 'libxi')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('21c3eb0633f839a223192dbc26aaf924bed98caad302ee0bb3ee2b067d09462d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
