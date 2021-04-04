# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-catalyst-runtime
pkgver=5.90128
pkgrel=1
pkgdesc='The Catalyst Framework Runtime'
_dist=Catalyst-Runtime
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-simple' 'perl-cgi-struct' 'perl-class-c3-adopt-next' 'perl-class-data-inheritable' 'perl-class-load' 'perl-data-dump' 'perl-data-optlist' 'perl-html-parser' 'perl-http-body' 'perl-http-message' 'perl-http-request-ascgi' 'perl-hash-multivalue' 'perl-json-maybexs' 'perl-list-moreutils' 'perl-mro-compat' 'perl-module-pluggable' 'perl-moose' 'perl-moosex-emulate-class-accessor-fast' 'perl-moosex-getopt' 'perl-moosex-methodattributes' 'perl-moosex-role-withoverloading' 'perl-path-class' 'perl-plack' 'perl-plack-middleware-fixmissingbodyinredirect' 'perl-plack-middleware-methodoverride' 'perl-plack-middleware-removeredundantbody' 'perl-plack-middleware-reverseproxy' 'perl-plack-test-externalserver' 'perl-safe-isa' 'perl-stream-buffered' 'perl-string-rewriteprefix' 'perl-sub-exporter' 'perl-task-weaken' 'perl-text-simpletable' 'perl-tree-simple' 'perl-tree-simple-visitorfactory' 'perl-try-tiny' 'perl-uri' 'perl-uri-ws' 'perl-libwww' 'perl-namespace-autoclean' 'perl-namespace-clean' 'perl')
makedepends=('perl-io-stringy' 'perl-json-maybexs')
checkdepends=('perl-test-fatal' 'perl-perlio-utf8-strict')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/$_dist-$pkgver.tar.gz")
sha512sums=('73f1c16a5531e9d366bd27c10fa4be02303e516cde11117bc2e63a57f33048916b4f1cea272cee26fd97e83fdbbdc836337c02bfb4c0551e7e6b106c6d8717ee')
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