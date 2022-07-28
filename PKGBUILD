# Contributor: Ordoban < dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-elasticsearch'
_pkgname='Search-Elasticsearch'
pkgver='7.717'
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
md5sums=('16f29f464fff8782925dda5b44bed1ef')
sha512sums=('ff35ae946d90988c9b022b48b09be5b036d1399aeee148df009f83faa49fd1b8d66e1f379c14a1ab481d17f753b6fe0d43291da4714aa50a8732a37ebd3e093a')
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
