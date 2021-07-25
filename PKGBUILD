# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=perl-date-holidayparser
pkgver=0.43
pkgrel=1
pkgdesc="Parser for .holiday-files"
arch=('x86_64')
url="https://search.cpan.org/dist/Date-HolidayParser/"
license=('PerlArtistic' 'GPL')
depends=('perl-moo')
options=(!emptydirs)
source=(https://search.cpan.org/CPAN/authors/id/Z/ZE/ZERODOGG/Date-HolidayParser-$pkgver.tar.gz)
sha256sums=('d61f6850e669e41d221e598fd09d9ec2f29a8138d9679609f02a31bb817e0a6b')

build() {
  cd "$srcdir/Date-HolidayParser-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/Date-HolidayParser-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Date-HolidayParser-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}