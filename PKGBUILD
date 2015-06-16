# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-unix-statgrab'
pkgver='0.04'
pkgrel='2'
pkgdesc="Perl extension for collecting information about the machine"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libstatgrab>=0.17' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Unix-Statgrab'
source=('http://search.cpan.org/CPAN/authors/id/V/VP/VPARSEVAL/Unix-Statgrab-0.04.tar.gz')
md5sums=('94787010e27183ce5cf354c58c465d0d')
sha512sums=('8e02f1424b8657568a310766630f8a2ea94c0abef4d6ebf84d4e605e21e685797bc44823ccde81b46bb97681b95b3dd6fff805035aba7a571cb136b216aa42a6')
_distdir="Unix-Statgrab-0.04"

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
