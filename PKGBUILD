# Contributor: BluePeril "<blueperil@blueperil.de>"
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-www-mechanize-catalyst'
pkgver='0.62'
pkgrel='1'
pkgdesc="Test::WWW::Mechanize for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-load>=0.19' 'perl-moose>=0.67' 'perl-test-www-mechanize>=1.14' 'perl-www-mechanize>=1.54' 'perl-libwww>=0' 'perl-namespace-clean>=0.09' 'perl>=5.8.4')
makedepends=('perl-catalyst-plugin-session>=0' 'perl-catalyst-plugin-session-state-cookie>=0' 'perl-test-exception>=0' 'perl-test-utf8>=0')
url='https://metacpan.org/release/Test-WWW-Mechanize-Catalyst'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/Test-WWW-Mechanize-Catalyst-0.62.tar.gz')
md5sums=('ca56e1c8cef26ef720e69350fd62b010')
sha512sums=('06a44d7dd8d4fe9a7a8d793883ca539193785748756610f7db7f131bd6793d3acb7a0f1809c5b0fb91db205c1a5cb84ce4cc50057df5171667b5b699f638c392')
_distdir="Test-WWW-Mechanize-Catalyst-0.62"

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
