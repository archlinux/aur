# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.2.2
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.19.7' 'mesa>=7.7')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.2/clutter-${pkgver}.tar.bz2)
sha256sums=('57debf025ca8e576328fcbb4bd897e5a6889921132f2ebfd7e035f7e8975982c')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
