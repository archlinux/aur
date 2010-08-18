# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=0.10.6
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter>=1.2.12' 'gtk2>=2.20.1')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('c65ec1e6b2932ed23b3db145357a96ae5ec7cb0666139468eba781d6c56a5371')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
