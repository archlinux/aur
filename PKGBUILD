# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-www-tumblr'
pkgver='5.00'
pkgrel='1'
pkgdesc="Perl bindings for the Tumblr API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json' 'perl-moose' 'perl-net-oauth' 'perl-libwww')
makedepends=()
url='http://search.mcpan.org/dist/WWW-Tumblr'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMOG/WWW-Tumblr-5.00.tar.gz')
md5sums=('a38be3642f4f5dc948601199967e0183')
sha512sums=('76cefc934176160d19130207389cd6c15788b1dd8bf3f0d8fb2cc95aba4eddc153bd92790cc9de25bbd0820b4247849f7647c71a374116a689a2f96c8b979ec5')
_distdir="WWW-Tumblr-5.00"

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
