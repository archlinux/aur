# $Id: $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=0.10.2
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter>=1.0.4')
source=(http://www.clutter-project.org/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('bb275b07f722631ff1764dd212843d11')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
