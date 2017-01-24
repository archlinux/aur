# $Id: PKGBUILD 138787 2015-08-26 14:57:27Z arodseth $
# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=pygoocanvas
pkgver=0.14.1
pkgrel=7
pkgdesc='GooCanvas Python bindings'
arch=('x86_64' 'i686')
url='https://wiki.gnome.org/Projects/PyGoocanvas'
license=('LGPL')
depends=('python2' 'goocanvas1' 'pygtk')
makedepends=('pkgconfig' 'git' 'gtk-doc')
options=('docs')
source=("git://github.com/GNOME/pygoocanvas.git#tag=${pkgname^^}_${pkgver//./_}")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  ./autogen.sh
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr --disable-docs
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
}

# getver: raw.githubusercontent.com/GNOME/pygoocanvas/master/NEWS
# vim:set ts=2 sw=2 et:
