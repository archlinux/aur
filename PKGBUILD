# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marcell Meszaros < marcell.meszaros at runbox.eu >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-catalyst-runtime
pkgver=5.90129
pkgrel=1
pkgdesc='The Catalyst Framework Runtime'
_dist=Catalyst-Runtime
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-simple' 'perl-cgi-struct' 'perl-class-c3-adopt-next' 'perl-class-data-inheritable' 'perl-class-load' 'perl-data-dump' 'perl-data-optlist' 'perl-html-parser' 'perl-http-body' 'perl-http-message' 'perl-http-request-ascgi' 'perl-hash-multivalue' 'perl-json-maybexs' 'perl-list-moreutils' 'perl-mro-compat' 'perl-module-pluggable' 'perl-moose' 'perl-moosex-emulate-class-accessor-fast' 'perl-moosex-getopt' 'perl-moosex-methodattributes' 'perl-path-class' 'perl-plack' 'perl-plack-middleware-fixmissingbodyinredirect' 'perl-plack-middleware-methodoverride' 'perl-plack-middleware-removeredundantbody' 'perl-plack-middleware-reverseproxy' 'perl-plack-test-externalserver' 'perl-safe-isa' 'perl-stream-buffered' 'perl-string-rewriteprefix' 'perl-sub-exporter' 'perl-task-weaken' 'perl-text-simpletable' 'perl-tree-simple' 'perl-tree-simple-visitorfactory' 'perl-try-tiny' 'perl-uri' 'perl-uri-ws' 'perl-libwww' 'perl-namespace-autoclean' 'perl-namespace-clean')
makedepends=('perl-io-stringy' 'perl-json-maybexs')
checkdepends=('perl-test-fatal' 'perl-perlio-utf8-strict' 'perl-devel-cycle' 'perl-padwalker' 'perl-type-tiny')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/$_dist-$pkgver.tar.gz")
sha512sums=('679799763e343cca5ee0ceef207cc4508c35bfe15a44e10d54b660413d0e4dc882680fe0dc1a1a512ed0c1503bbdf9a853b7245671537d650447d70190083efa')
build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
