# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=emacs-psgml
_progname=psgml
pkgver=1.4.0
pkgrel=2
pkgdesc="An Emacs major mode for editing SGML documents (alpha version)"
depends=('emacs')
makedepends=('sed')
conflicts=('psgml-stable')
install=psgml.install
url="http://emacs.1067599.n5.nabble.com/psgml-fixed-to-work-with-Emacs-24-td282593.html"
license=('GPL')
arch=('any')
source=(http://www.fsavigny.de/gpled-software/psgml-1.4.0.tar.gz)
md5sums=('15708585d27746db97c110276da3cef0')

build() {
  cd $srcdir/$_progname-$pkgver
  ./configure --prefix=/usr
  sed 's/prefix = \/usr/prefix = ${DESTDIR}\/usr/' -i Makefile
  make 
}

package() {
  cd $srcdir/$_progname-$pkgver
  make DESTDIR=$pkgdir install
}
