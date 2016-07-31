# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=rep-gtk
pkgver=0.90.8.3
pkgrel=1
pkgdesc="Binding of the GTK and GDK libraries for the librep Lisp environment"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Rep-GTK"
license=('GPL')
depends=('librep' 'gtk2')
source=(http://download.tuxfamily.org/librep/rep-gtk/${pkgname}_${pkgver}.tar.xz)
sha256sums=('a96575db45794eefd0564172967a38ef2d7fec3ae2644c478e9f7d54b99ff341')
options=('!libtool')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
}
