# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-method-signatures'
pkgver='1.003019'
pkgrel='1'
pkgdesc="Perl6 like method signature parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.19' 'perl-list-moreutils>=0.20' 'perl-moose>=0' 'perl-moosex-traits>=0.06' 'perl-moosex-types>=0.17' 'perl-moosex-types-structured>=0' 'perl-ppi>=1.203' 'perl-namespace-clean>=0.10')
makedepends=('perl-aliased>=0')
checkdepends=('perl-test-differences>=0' 'perl-test-exception>=0')
url='https://metacpan.org/release/Parse-Method-Signatures'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Parse-Method-Signatures-1.003019.tar.gz')
md5sums=('5236c145815db7001841ed8efb305c9f')
sha512sums=('88caed3b2ed92b5d2bc972acc843a31a26f4c76fc6d9782a05176964e4148b5e79e54010b371bf84988e804eb973937b7b591c2b5d50d0ec3be5d91fd3af51ec')
_distdir="Parse-Method-Signatures-1.003019"

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
