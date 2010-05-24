# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.2.8
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.20.1' 'mesa>=7.7.1')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.2/clutter-${pkgver}.tar.bz2)
sha256sums=(' bdc1583572546bf1d5497fcb36b1affaf868af6213d04c720274ab96c3996179')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
