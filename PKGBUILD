# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=0.10.4
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter>=1.2.8' 'gtk2>=2.20.1')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fd015e8080e1212dacc95d0e3d776d0d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
