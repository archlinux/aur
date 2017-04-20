# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-flickr-api'
pkgver='1.28'
pkgrel='1'
pkgdesc="Perl interface to the Flickr API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=1.56' 'perl-net-oauth' 'perl-uri>=1.18' 'perl-xml-libxml-simple' 'perl-xml-parser-lite-tree>=0.06' 'perl-libwww' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-script')
url='https://metacpan.org/release/Flickr-API'
source=('http://search.cpan.org/CPAN/authors/id/L/LB/LBMOORE/Flickr-API-1.28.tar.gz')
md5sums=('09f44555942d7c94410e20af60b9462d')
sha512sums=('4d24f68fdb2e2b7805941333e160a5f1992c7816d7fba211637e94c18b1cf6c009729801bb2342cd5d897b13c1f37528932df7451369c005bbca8cc61f03f130')
_distdir="Flickr-API-1.28"

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
