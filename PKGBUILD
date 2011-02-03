# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.6.0
pkgrel=2
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gdk-pixbuf2>=2.22.1' 'json-glib>=0.12.2' 'atk>=1.32.0' 'pango>=1.28.3' 'mesa>=7.10' 'libxcomposite' 'libxi')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/clutter/1.6/clutter-${pkgver}.tar.bz2)
sha256sums=('7e956fad7b8f7aa78500c155c824584201e2b8c4117da61a1f7ec2c120945400')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection
  make
  make DESTDIR="${pkgdir}" install
}
