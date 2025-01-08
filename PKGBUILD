# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-runtime'
pkgver='5.90132'
pkgrel='1'
pkgdesc="The Catalyst Framework Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-simple>=0' 'perl-cgi-struct>=0' 'perl-class-c3-adopt-next>=0.07' 'perl-class-load>=0.12' 'perl-data-dump>=0' 'perl-data-optlist>=0' 'perl-html-parser>=0' 'perl-http-body>=1.22' 'perl-http-message>=0' 'perl-hash-multivalue>=0' 'perl-json-maybexs>=1.000000' 'perl-mro-compat>=0' 'perl-module-pluggable>=0' 'perl-moose>=2.1400' 'perl-moosex-emulate-class-accessor-fast>=0.00903' 'perl-moosex-getopt>=0.48' 'perl-moosex-methodattributes>=0' 'perl-path-class>=0.09' 'perl-perlio-utf8-strict>=0' 'perl-plack>=0.9991' 'perl-plack-middleware-fixmissingbodyinredirect>=0.09' 'perl-plack-middleware-methodoverride>=0.12' 'perl-plack-middleware-removeredundantbody>=0.03' 'perl-plack-middleware-reverseproxy>=0.04' 'perl-plack-test-externalserver>=0' 'perl-safe-isa>=0' 'perl-stream-buffered>=0' 'perl-string-rewriteprefix>=0.004' 'perl-sub-exporter>=0' 'perl-task-weaken>=0' 'perl-text-simpletable>=0.03' 'perl-tree-simple>=1.15' 'perl-tree-simple-visitorfactory>=0' 'perl-try-tiny>=0.17' 'perl-uri>=1.65' 'perl-uri-ws>=0.03' 'perl-libwww>=0' 'perl-namespace-clean>=0.23' 'perl>=5.8.3')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Catalyst-Runtime'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-Runtime-5.90132.tar.gz')
md5sums=('ce3b03cc998fcef45d5a0bd49d923caf')
sha512sums=('773875f0607179b5c0a929fe0a49d635613bb9f4924111b2a22617cdc63675947a378a0acad5c54c91133b345e817e0ce305c5aa35b53950308b9f3c6bf50519')
_distdir="Catalyst-Runtime-5.90132"

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
