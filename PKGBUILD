# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-date-pcalc'
pkgver='6.1'
pkgrel='1'
pkgdesc="Gregorian calendar date calculations"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bit-vector>=7.1' 'perl-carp-clan>=5.3')
makedepends=()
url='http://search.cpan.org/dist/Date-Pcalc'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STBEY/Date-Pcalc-6.1.tar.gz')
md5sums=('6a719d8fe10ac673be5d09e003130aa8')
sha512sums=('3f234e505f068e068608e76f5963f85172c1b04b5770d24d33bff704b2a50f1e4f222cfdf2cc5a992e618078f0bf018838278db2cd00e8037bdb2482eb0907c2')
_distdir="Date-Pcalc-6.1"

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

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
