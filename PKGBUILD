# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-methodattributes'
pkgver='0.29'
pkgrel='1'
pkgdesc="code attribute introspection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.98' 'perl-moosex-types' 'perl-namespace-clean>=0.10')
makedepends=('perl-namespace-autoclean' 'perl-test-exception' 'perl-test-checkdeps')
url='http://search.cpan.org/dist/MooseX-MethodAttributes'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-MethodAttributes-$pkgver.tar.gz")
md5sums=('c28066933bb5a0e97a5e2dbb0d2e0edf')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
