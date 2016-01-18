# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-jira-rest'
pkgver='0.012'
pkgrel='1'
pkgdesc="Thin wrapper around JIRA's REST API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree' 'perl-http-message' 'perl-json' 'perl-rest-client' 'perl-uri' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/JIRA-REST'
source=('http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/JIRA-REST-0.012.tar.gz')
md5sums=('326a43f66fa808f847fd5b703597f2f2')
sha512sums=('cd123f58fb6364115c85e6b00815688b583da6bd4c4f6561085fee93ac68f304f24256a83a3c4d2c2b785f8c59a8385d3532af3f9c746cb6cf524064030a0e88')
_distdir="JIRA-REST-0.012"

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
