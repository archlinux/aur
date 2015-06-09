# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=wxhexeditor
pkgver=0.23
pkgrel=2
pkgdesc="a free hex editor / disk editor for Linux, Windows and MacOSX"
arch=('i686' 'x86_64')
url="http://wxhexeditor.sourceforge.net/"
license=('GPL')
makedepends=('wxgtk')
source=("http://downloads.sourceforge.net/project/wxhexeditor/wxHexEditor/v${pkgver}%20Beta/wxHexEditor-v${pkgver}-src.tar.bz2")
md5sums=('d0e785c95cf40737246e5b2cc4cb7204')


build() {
  cd "$srcdir/wxHexEditor"
  make CC=gcc CPP=cpp CXX=g++
}

package() {
  cd "$srcdir/wxHexEditor"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
