# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mkbib  
pkgver=2.1
pkgrel=2
pkgdesc="A gtk3-Program to create bibtex-files"
url="http://mirror.ctan.org/biblio/bibtex/utils/mkbib"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libsoup')
makedepends=('intltool' 'itstool')
source=(http://mirror.ctan.org/biblio/bibtex/utils/mkbib.zip)
md5sums=('4d4695802ba069112aeabb494f354e82')
build() {
  cd $srcdir/$pkgname
  chmod 750 configure
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}
