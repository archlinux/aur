# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.7.90
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl>=1.7.6' 'mesa' 'json-glib' 'atk' 'libxi')
makedepends=('gobject-introspection' 'mesa')
source=(http://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('36b98d400ce9397e66e7b4f6f424a7185dadba0350651ae20964f494ec40b190')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
