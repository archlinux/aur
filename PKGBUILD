# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-kit'
pkgver='2.16'
pkgrel='1'
pkgdesc="Build custom test packages with only the features you want"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hook-lexwrap>=0' 'perl-import-into>=0' 'perl-module-runtime>=0' 'perl-sub-delete>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-nowarnings>=0' 'perl-test-output>=0' 'perl-test-pod>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Test-Kit'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAORU/Test-Kit-2.16.tar.gz')
md5sums=('396500ae77991ac2e3ea1a90bb66d5c5')
sha512sums=('077fa559cd1582c9ef30427ddba0bd77a8dde0d9e979dfc92e7f35781363e701f14c90e31a85df8e7c924ab7f9af4125bffe892b10b56cc2f6ef1d3a3b590364')
_distdir="Test-Kit-2.16"

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
