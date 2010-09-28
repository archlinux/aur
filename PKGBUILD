# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.4.0
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gdk-pixbuf2>=2.22.0' 'json-glib>=0.12.0' 'atk>=1.32.0' 'pango>=1.28.1' 'mesa>=7.8' 'libxcomposite')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/clutter/1.4/clutter-${pkgver}.tar.bz2)
sha256sums=('bcdb2c55a083b8f18b0205e816c303605926b03e19f380294a203ae19ec02c96')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
  make DESTDIR="${pkgdir}" install
}
