# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Tobias Mueller <gtklp@sirtobi.com>
# Contributor: Tobias Mueller <gtklp@sirtobi.com>
pkgname=gtklp
pkgver=1.3.1
pkgrel=1
pkgdesc="a graphical frontend for cups, the linux printing system"
arch=(i686 x86_64)
url="http://gtklp.sirtobi.com/"
license=('GPL')
groups=
provides=
depends=('cups' 'gtk2')
makedepends=
conflicts=
replaces=
backup=
install=
source=(https://sourceforge.net/projects/gtklp/files/gtklp/$pkgver/gtklp-$pkgver.src.tar.gz/download)
md5sums=('4b77d070aafeab45d134a4f9a12883bb')

build() {
  cd $srcdir/$pkgname-$pkgver
  aclocal -I m4 
  autoheader --force
  autoconf --force 
  automake --add-missing --copy --include-deps --foreign --force-missing
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}


