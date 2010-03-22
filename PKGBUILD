# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.2.4
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.19.7' 'mesa>=7.7')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.2/clutter-${pkgver}.tar.bz2)
sha256sums=(' 14528674af19eca4f6638c6e1e0ac07e40d047a6a31bac2f8cbb6ee0349ccb65')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
