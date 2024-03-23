# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-structured'
pkgver='0.36'
pkgrel='1'
pkgdesc="Structured Type Constraints for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-partialdump>=0.13' 'perl-moose>=0' 'perl-moosex-types>=0.22' 'perl-sub-exporter>=0.982' 'perl-namespace-clean>=0.19' 'perl>=5.008')
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=('perl-datetime>=0' 'perl-moosex-types>=0' 'perl-test-fatal>=0' 'perl-test-needs>=0')
url='https://metacpan.org/release/MooseX-Types-Structured'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-Structured-0.36.tar.gz')
md5sums=('d29c7bdaf44a90b3871dc040157015c5')
sha512sums=('02d5a7ec823549a5a1422f67aa2099358870e36f0b8e9244776ce28a16708639f6d63e88cc02a7b301c3663fc4dfa4c3732049383c21a1f86f3eb68cb9ace978')
_distdir="MooseX-Types-Structured-0.36"

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
