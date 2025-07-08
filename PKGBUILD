# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=tk-splash
pkgver=0.16
pkgrel=2
pkgdesc="create a splash screen"
depends=('tk' 'perl')
arch=('any')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-Splash-$pkgver.tar.gz)
url="https://metacpan.org/dist/Tk-Splash"
md5sums=('0fa1f21f98e558fe07d9dfcd0350c256')

build() {
  cd $srcdir/Tk-Splash-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

check() {
  cd $srcdir/Tk-Splash-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make test
}

package() {
  cd $srcdir/Tk-Splash-$pkgver
  make DESTDIR=$pkgdir install
  /usr/bin/find $pkgdir -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $pkgdir -name 'perllocal.pod' -exec rm '{}' \;
}
