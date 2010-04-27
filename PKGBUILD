# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.2.6
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.20.0' 'mesa>=7.7.1')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.2/clutter-${pkgver}.tar.bz2)
sha256sums=('aafb7ee0c7132d42338e8041077fbb1a8be321c59b32218a5b3418305b815d0d')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
