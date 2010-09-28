# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=0.10.8
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter>=1.4.0' 'gtk2>=2.22.0')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('7867f951568871d9f68cbe8a3644fd53d2138f725b7ba61ffc0053eb64e80814')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
