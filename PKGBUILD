# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mkbib  
pkgver=2.1
pkgrel=3
pkgdesc="A gtk3-Program to create bibtex-files"
url="http://mirror.ctan.org/biblio/bibtex/utils/mkbib"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libsoup')
makedepends=('intltool' 'itstool' 'gcc6')
source=(https://mirror.ctan.org/biblio/bibtex/utils/mkbib.zip)
sha256sums=('3831566b207560b1be8a95aad04979a1044564359b48a9bc7204ae317999a6f5')

build() {
  cd $pkgname
  CC=gcc-6 ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
