# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-harness'
pkgver='3.48'
pkgrel='1'
pkgdesc="Run Perl standard test scripts with statistics"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-Harness'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Test-Harness-3.48.tar.gz')
md5sums=('08ca8899219da86ba5d3f3fe44b535e7')
sha512sums=('7d65b48157ec7bc63553144f68e6233c07d21a4d127cefd5f77b2193c47f4d96325b15a9eb029ed62a19340f65659fcef0796ff7c6b07e5b5b8d539ddeee485c')
_distdir="Test-Harness-3.48"

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
