# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=tk-splash
pkgver=0.14
pkgrel=3
pkgdesc="create a splash screen"
depends=('tk')
arch=('any')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-Splash-$pkgver.tar.gz)
url="http://search.cpan.org/~srezic/Tk-Splash/"
md5sums=('6e99ee50ce64fec15526b5bb3d950601')

build() {
  cd $srcdir/Tk-Splash-$pkgver
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/Tk-Splash-$pkgver
  make DESTDIR=$pkgdir install
  /usr/bin/find $pkgdir -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $pkgdir -name 'perllocal.pod' -exec rm '{}' \;
}
