# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread
_realname=Spread
pkgver=3.17.4.4
pkgrel=2
pkgdesc="Perl extension for the Spread group communication system"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~jesus/Spread-3.17.4.4/Spread.pm"
license=('LGPL' 'Perl')
depends=('perl' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig' 'libunique' 'spread-daemon')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESUS/Spread-$pkgver.tar.gz)
md5sums=('751314b7494530ad8feff2c10ac23010')

build() {
  cd  $srcdir/$_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
