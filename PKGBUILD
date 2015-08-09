# Contributor: GPP <gergan@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-most'
pkgver='0.34'
pkgrel='1'
pkgdesc="Most commonly needed test functions and features."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-class>=1.14' 'perl-test-deep>=0.106' 'perl-test-differences>=0.61' 'perl-test-exception>=0.31' 'perl-test-warn>=0.23')
makedepends=()
url='https://metacpan.org/release/Test-Most'
source=('http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Test-Most-0.34.tar.gz')
md5sums=('6fa1f097bedbc18f46b08ac9eb79bba9')
sha512sums=('00706bb25e6b9f806b536f75f66356413cdbcb19efd1c8b163fbd3357f61abe9e06e57c311eff216d36962ce74beb996db6cd4f0d2e5ed58fa5c0a0af32a33ef')
_distdir="Test-Most-0.34"

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
