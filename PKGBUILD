# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=rep-gtk
pkgver=0.90.8.2
pkgrel=1
pkgdesc="Binding of the GTK and GDK libraries for the librep Lisp environment"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Rep-GTK"
license=('GPL')
depends=('librep' 'gtk2')
source=(http://download.tuxfamily.org/librep/rep-gtk/${pkgname}_${pkgver}.tar.xz)
sha1sums=('46769dfca8924e24f64ef200d6059aba49d35f5b')
options=('!libtool')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
}
