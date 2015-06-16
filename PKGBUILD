# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-search-elasticsearch'
pkgver='1.19'
pkgrel='1'
pkgdesc="The official client for Elasticsearch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-uri-escape' 'perl-http-message' 'perl-hijk>=0.12' 'perl-io-socket-ssl' 'perl-json-maybexs>=1.002002' 'perl-log-any>=1.02' 'perl-log-any-adapter-callback' 'perl-module-runtime' 'perl-moo>=1.003' 'perl-package-stash>=0.34' 'perl-sub-exporter' 'perl-try-tiny' 'perl-uri' 'perl-libwww' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-exception')
url='https://metacpan.org/release/Search-Elasticsearch'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRTECH/Search-Elasticsearch-1.19.tar.gz')
md5sums=('5ad130c47735c438603bcaf8503a2a8d')
sha512sums=('ec7e1e858c5efbe9641f27e44e4f89fe1cab7c65759f0d7a8fa7d6f72dee3075ea83ab52b137e94941bc299d8939768ca3b97e4938ce99040edc6495c24a7b8d')
_distdir="Search-Elasticsearch-1.19"

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
