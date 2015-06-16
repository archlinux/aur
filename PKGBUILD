# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-http'
pkgver='0.40'
pkgrel='1'
pkgdesc="Date conversion routines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.17' 'perl-http-date>=1.44')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-HTTP'
source=('http://search.cpan.org/CPAN/authors/id/C/CK/CKRAS/DateTime-Format-HTTP-0.40.tar.gz')
md5sums=('dac502bc95a4c034ce03dcec7941b308')
sha512sums=('1884f692e0c8d40ce5dc1786131094d2064270fb1d1e32df3bf8bedaa4ac863f53688ec53e95260a48cd20e878a77af5952eb0d6f03ccd09b4a14d024f7167a0')
_distdir="DateTime-Format-HTTP-0.40"

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
