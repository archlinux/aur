# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri
pkgver=2.12.23
pkgrel=6
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
depends=('perl-perl4-corelibs')
makedepends=('ghostscript' 'imagemagick' 'texlive-core')
source=(http://downloads.sourceforge.net/gri/$pkgname-$pkgver.tar.gz)
md5sums=('eabd37f80ac51f7aef83a89234fb6522')
install=gri.install
options=('!makeflags')

prepare() {
  sed -i '18489s+@subsubsection+@subsection+' $srcdir/$pkgname-$pkgver/doc/gri.texi
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
