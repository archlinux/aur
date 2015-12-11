# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=tk-resizebutton
pkgver=0.01
pkgrel=3
pkgdesc="provides a resizeable button to be used in an HList column header."
depends=('tk')
arch=('any')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/X/XP/XPIX/Tk-ResizeButton-$pkgver.tar.gz)
url="http://search.cpan.org/~xpix/Tk-ResizeButton/"
md5sums=('b1c782ec46e3bcb7e52fdd5909645ad2')

build() {
  cd $srcdir/Tk-ResizeButton-$pkgver
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/Tk-ResizeButton-$pkgver
  make DESTDIR=$pkgdir install
  /usr/bin/find $pkgdir -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $pkgdir -name 'perllocal.pod' -exec rm '{}' \;
}
