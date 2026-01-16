# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-runtime'
pkgver='5.90132'
pkgrel='2'
pkgdesc="The Catalyst Framework Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-cgi-simple' 'perl-cgi-struct' 'perl-class-c3-adopt-next>=0.07' 'perl-class-load>=0.12' 'perl-data-dump' 'perl-data-optlist' 'perl-html-parser' 'perl-http-body>=1.22' 'perl-http-message' 'perl-hash-multivalue' 'perl-json-maybexs>=1.000000' 'perl-mro-compat' 'perl-module-pluggable' 'perl-moose>=2.1400' 'perl-moosex-emulate-class-accessor-fast>=0.00903' 'perl-moosex-getopt>=0.48' 'perl-moosex-methodattributes' 'perl-path-class>=0.09' 'perl-perlio-utf8-strict' 'perl-plack>=0.9991' 'perl-plack-middleware-fixmissingbodyinredirect>=0.09' 'perl-plack-middleware-methodoverride>=0.12' 'perl-plack-middleware-removeredundantbody>=0.03' 'perl-plack-middleware-reverseproxy>=0.04' 'perl-plack-test-externalserver' 'perl-safe-isa' 'perl-stream-buffered' 'perl-string-rewriteprefix>=0.004' 'perl-sub-exporter' 'perl-task-weaken' 'perl-text-simpletable>=0.03' 'perl-tree-simple>=1.15' 'perl-tree-simple-visitorfactory' 'perl-try-tiny>=0.17' 'perl-uri>=1.65' 'perl-libwww' 'perl-namespace-clean>=0.23' 'perl>=5.8.3')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Catalyst-Runtime'
source=('https://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-Runtime-5.90132.tar.gz')
md5sums=('ce3b03cc998fcef45d5a0bd49d923caf')
sha512sums=('773875f0607179b5c0a929fe0a49d635613bb9f4924111b2a22617cdc63675947a378a0acad5c54c91133b345e817e0ce305c5aa35b53950308b9f3c6bf50519')
b2sums=('9e928d456425bf104e3766975d706593583be3dc190f84744e484067d24bc5c69513b84e0a75a2f9c76f85628777da8526928869ee7fa07e19c237531eab020c')
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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
