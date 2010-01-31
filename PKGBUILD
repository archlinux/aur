# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.0.10
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('gtk2>=2.18.6' 'mesa>=7.5.1')
makedepends=('gobject-introspection')
source=(http://www.clutter-project.org/sources/clutter/1.0/clutter-${pkgver}.tar.bz2)
sha256sums=('6fb98dc4d16a3a98be734cf0a6cc4f8d8179800603c3e41011c414eeaf1f456b')

build() {
  cd "${srcdir}/clutter-${pkgver}"
  ./configure --prefix=/usr --enable-introspection || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
