# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.2.0
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.19.6' 'mesa>=7.7')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.2/clutter-${pkgver}.tar.bz2)
sha256sums=('009058e3b0985d34b94527440ad0f4444dba66c1c5f2ca036fa2b846fd32c3c8')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
