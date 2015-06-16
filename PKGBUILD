# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-catalyst-runtime'
pkgver='5.90093'
pkgrel='1'
pkgdesc="The Catalyst Framework Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-simple' 'perl-cgi-struct' 'perl-class-c3-adopt-next>=0.07' 'perl-class-data-inheritable' 'perl-class-load>=0.12' 'perl-data-dump' 'perl-data-optlist' 'perl-html-parser' 'perl-http-body>=1.22' 'perl-http-message' 'perl-http-request-ascgi>=1.0' 'perl-hash-multivalue' 'perl-json-maybexs>=1.000000' 'perl-list-moreutils' 'perl-mro-compat' 'perl-module-pluggable' 'perl-moose>=1.03' 'perl-moosex-emulate-class-accessor-fast>=0.00903' 'perl-moosex-getopt>=0.48' 'perl-moosex-methodattributes' 'perl-moosex-role-withoverloading>=0.09' 'perl-path-class>=0.09' 'perl-plack>=0.9991' 'perl-plack-middleware-fixmissingbodyinredirect>=0.09' 'perl-plack-middleware-methodoverride>=0.12' 'perl-plack-middleware-removeredundantbody>=0.03' 'perl-plack-middleware-reverseproxy>=0.04' 'perl-plack-test-externalserver' 'perl-safe-isa' 'perl-stream-buffered' 'perl-string-rewriteprefix>=0.004' 'perl-sub-exporter' 'perl-task-weaken' 'perl-text-simpletable>=0.03' 'perl-tree-simple>=1.15' 'perl-tree-simple-visitorfactory' 'perl-try-tiny>=0.17' 'perl-uri>=1.65' 'perl-uri-ws>=0.03' 'perl-libwww' 'perl-namespace-autoclean>=0.09' 'perl-namespace-clean>=0.23' 'perl>=5.8.3')
makedepends=('perl-io-stringy' 'perl-json-maybexs')
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Catalyst-Runtime'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-Runtime-5.90093.tar.gz')
md5sums=('6de311dabb2ee02fa8b46dc0106c1d50')
sha512sums=('53fb7a4b8cc17cfcdfd083589552288c1f0d4d489a7cdc6e51fd13a5607308e9a411e119ddfdf7982f94b91bb021154d4164ca799684088891b8d893692e1249')
_distdir="Catalyst-Runtime-5.90093"

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
