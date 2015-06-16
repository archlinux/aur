# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-poe-filter-xml'
pkgver='1.140700'
pkgrel='1'
pkgdesc="XML parsing for the POE framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-insideout' 'perl-moosex-nonmoose' 'perl-poe' 'perl-xml-libxml' 'perl-xml-sax-base')
makedepends=()
url='http://search.mcpan.org/dist/POE-Filter-XML'
source=('http://search.mcpan.org/CPAN/authors/id/N/NP/NPEREZ/POE-Filter-XML-1.140700.tar.gz')
md5sums=('84cb678f898cd8c2383a864ae69dd8f2')
sha512sums=('d6a6321a35ac38086ebc6f8fe099b3d273e6bdcabe457e5644d1da2802d0e821257f2304206b2db87676f7a58acbdf0a6eb9cf0aad848a7b6c725733bce18f4f')
_distdir="POE-Filter-XML-1.140700"

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
