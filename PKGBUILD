# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=byojeopardy
pkgver=1.2.14
pkgrel=3
pkgdesc="Build Your Own Jeopardy is a program to create and play Jeopardy-like games."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/byojeopardy/"
license=('GPL')
depends=('libxslt' 'gtk2')
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz?download)
md5sums=('a647a73c2787b247c80056be8e01f2ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
