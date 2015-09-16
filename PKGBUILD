# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-jira-rest'
pkgver='0.011'
pkgrel='1'
pkgdesc="Thin wrapper around JIRA's REST API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-util' 'perl-html-tree' 'perl-http-message' 'perl-json' 'perl-rest-client' 'perl-uri' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/JIRA-REST'
source=('http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/JIRA-REST-0.011.tar.gz')
md5sums=('c9a94f75003a8dc0c98887b5bad52d84')
sha512sums=('6853b8738d678ae2c5f3f4db03247f2737aa97494e7ba03e19d43228f2180deb14ed35caf90a11db22b61acdd2f78b906141fdb297fb63d3e99a5bf8d98b25be')
_distdir="JIRA-REST-0.011"

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
