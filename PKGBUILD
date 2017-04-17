# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-elasticsearch'
pkgver='5.02'
pkgrel='1'
pkgdesc="The official client for Elasticsearch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-uri-escape' 'perl-devel-globaldestruction' 'perl-http-message' 'perl-io-socket-ssl' 'perl-json-maybexs>=1.002002' 'perl-log-any>=1.02' 'perl-log-any-adapter-callback>=0.09' 'perl-module-runtime' 'perl-moo>=2.001000' 'perl-package-stash>=0.34' 'perl-sub-exporter' 'perl-try-tiny' 'perl-uri' 'perl-libwww' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-exception' 'perl-test-sharedfork')
url='https://metacpan.org/release/Search-Elasticsearch'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRTECH/Search-Elasticsearch-5.02.tar.gz')
md5sums=('66cb4dd24bbc41ea526fddc32451e7bd')
sha512sums=('a119f8f0dde74cd4e4aa556815311ab8abb5f92ce057978f9a15c78c8aab9424dcfae641e508d32c1d06f5d315e347f74fd308081f8a0df3d71b6c6b492b767c')
_distdir="Search-Elasticsearch-5.02"

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
