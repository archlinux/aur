# Contributor: Ordoban < dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-elasticsearch'
pkgver='8.12'
pkgrel='1'
pkgdesc="The official client for Elasticsearch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-uri-escape>=0' 'perl-devel-globaldestruction>=0' 'perl-http-message>=0' 'perl-io-socket-ssl>=0' 'perl-json-maybexs>=1.002002' 'perl-log-any>=1.02' 'perl-log-any-adapter-callback>=0.09' 'perl-module-runtime>=0' 'perl-moo>=2.001000' 'perl-net-ip>=0' 'perl-package-stash>=0.34' 'perl-sub-exporter>=0' 'perl-try-tiny>=0' 'perl-uri>=0' 'perl-libwww>=0' 'perl-namespace-clean>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0' 'perl-test-pod>=0' 'perl-test-sharedfork>=0')
url='https://metacpan.org/release/Search-Elasticsearch'
source=("http://search.cpan.org/CPAN/authors/id/E/EZ/EZIMUEL/Search-Elasticsearch-$pkgver.tar.gz")
md5sums=('90a1b8d176429653c70394a0c4e50339')
sha512sums=('ed01dc2984b5cabd6d26cf8ef9ba7704e6be5694245b93851746bbef05a3cffe7b358fa7f0826715cac0bdebdb0b75bd599a63f40372ca1e7b32fec6bb20aa6d')
_distdir="Search-Elasticsearch-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
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
