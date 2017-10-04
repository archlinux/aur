# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-number-isordinal'
pkgver='0.05'
pkgrel='2'
pkgdesc="Perl/CPAN Module Lingua::EN::Number::IsOrdinal: Detect if English number is ordinal or cardinal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-findnumber' 'perl-try-tiny' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Lingua-EN-Number-IsOrdinal'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/Lingua-EN-Number-IsOrdinal-0.05.tar.gz')
md5sums=('dbf1a6563300a31141eb9276a32e31eb')
sha512sums=('45edc8343a89cd87a8d707ad6b406ed89708b88d7edc3edfdd1eb63e43520206e7accac6768e18d2db7bb81db3185fd2fb7537289f4bb29131e5e8ce774f70d1')
_distdir="Lingua-EN-Number-IsOrdinal-0.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
