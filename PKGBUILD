# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-chi-driver-berkeleydb'
pkgver='0.05'
pkgrel='1'
pkgdesc="Using BerkeleyDB for cache"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-berkeleydb>=0.30' 'perl-chi>=0.25')
makedepends=('perl-test-class' 'perl-test-most')
url='http://search.cpan.org/dist/CHI-Driver-BerkeleyDB'
source=('https://cpan.metacpan.org/authors/id/M/MS/MSCHOUT/CHI-Driver-BerkeleyDB-0.05.tar.gz')
md5sums=('2066310236d7d7570f694d7721fa181c')
_distdir="CHI-Driver-BerkeleyDB-0.05"

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
