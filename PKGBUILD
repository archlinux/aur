# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-session-state-stash'
pkgver='0.13'
pkgrel='1'
pkgdesc="Maintain session IDs using the stash"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-session>=0.27' 'perl-moose' 'perl-mro-compat' 'perl-namespace-autoclean')
makedepends=('perl-test-mockobject' 'perl-test-www-mechanize-catalyst' 'perl-uri')
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-State-Stash'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Session-State-Stash-0.13.tar.gz')
md5sums=('f1062d038f64a708d2788fc479210c42')
sha512sums=('7a120c544a405ddb6ce58d75c81c1a6c68cee62c85c0a3dcfb830a0e18e2b67ee46112191fe086d4727a92f1a3d2f30249a76fcd1c49bb4ea48b59bcdfa5e579')
_distdir="Catalyst-Plugin-Session-State-Stash-0.13"

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
