# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-elasticsearch'
_pkgname='Search-Elasticsearch'
pkgver='7.715'
pkgrel='1'
pkgdesc="The official client for Elasticsearch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-uri-escape' 'perl-devel-globaldestruction' 'perl-http-message' 'perl-io-socket-ssl' 'perl-json-maybexs>=1.002002' 'perl-log-any>=1.02' 'perl-log-any-adapter-callback>=0.09' 'perl-module-runtime' 'perl-moo>=2.001000' 'perl-package-stash>=0.34' 'perl-sub-exporter' 'perl-try-tiny' 'perl-uri' 'perl-libwww' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-exception' 'perl-test-sharedfork')
url='https://metacpan.org/release/Search-Elasticsearch'
source=("https://cpan.metacpan.org/authors/id/E/EZ/EZIMUEL/$_pkgname-$pkgver.tar.gz")
md5sums=('7cd320092379b1e49de67483690cf15e')
sha512sums=('82a53115ef9f24e935b8a105e51b32a1b21ccd9ae0f491685b51c1c425de99c01cf538a937479053ce9a55f0653b8640281e98eefb3d2db279f5b41a801ca03b')
_distdir="$_pkgname-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
