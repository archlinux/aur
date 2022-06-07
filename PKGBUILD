# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-moosex-traits
pkgver=0.13
pkgrel=2
pkgdesc="automatically apply roles at object creation time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.84' 'perl-namespace-autoclean' 'perl-sub-exporter' 'perl-moosex-role-parameterized')
makedepends=('perl-moose' 'perl-test-exception' 'perl-test-use-ok')
checkdepends=('perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Traits'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Traits-${pkgver}.tar.gz")
md5sums=('232530e9645abc20a4e7f14fdd022546')
sha512sums=('b5128105e66f2889b6ddfb5b5b871fd952bfe6e08f038cabcc5fa49e9f9f4a806dab06acf9756507613cb6c99e6d633f80c561d85be1d3a1a756039ed29acca2')
_distdir="MooseX-Traits-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
