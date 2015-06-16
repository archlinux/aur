# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi'
pkgver='3.0.17'
pkgrel='1'
pkgdesc="Simple Database Abstraction"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.18' 'perl-class-data-inheritable>=0.02' 'perl-class-trigger>=0.07' 'perl-clone' 'perl-ima-dbi>=0.33' 'perl-universal-moniker>=0.06')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI'
source=('http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Class-DBI-v3.0.17.tar.gz')
md5sums=('df59962bab98a0d31bf1d04d7270831b')
sha512sums=('006bc6ca754d24d9cb3791fa99128df597be1f96cb62c309a0f37f169e02e2baec6aa7e6395ddea8202df11488a9db52fa817d8fff7f925097769d70356d1fe7')
_distdir="Class-DBI-v3.0.17"

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
