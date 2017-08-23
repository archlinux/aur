# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rep-gtk-git
pkgver=0.90.8.3.4.gc66467c
pkgrel=1
pkgdesc="Binding of the GTK and GDK libraries for the librep Lisp environment - git version"
arch=('i686' 'x86_64')
url="http://rep-gtk.sourceforge.net/"
license=('GPL')
depends=('librep' 'gtk2')
conflicts=('rep-gtk')
provides=('rep-gtk=0.90.8.1')
options=('!libtool')
options=('libtool')
source=(git://github.com/SawfishWM/rep-gtk.git)
md5sums=('SKIP')
_gitname=rep-gtk

pkgver() {
  cd $_gitname
  echo $(git describe --tags |sed 's/-/./g'|cut -c9-)
}

build() {
  cd $_gitname

  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
