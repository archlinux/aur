# $Id: $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.0.4
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.17.11' 'mesa>=7.5.1')
source=(http://www.clutter-project.org/sources/clutter/1.0/clutter-${pkgver}.tar.bz2)
md5sums=('7e587d9406e362ea1151a81d37d5460c')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
