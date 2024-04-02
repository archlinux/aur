# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-checkmanifest'
pkgver='1.43'
pkgrel='1'
pkgdesc="Check if your Manifest matches your distro"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
checkdepends=('perl-pod-coverage-trustpod>=0')
url='https://metacpan.org/release/Test-CheckManifest'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/RENEEB/Test-CheckManifest-1.43.tar.gz')
md5sums=('b78307e336f88d405d5eb45ac5e83fc6')
sha512sums=('cd0a9bdc2e8cd366c4e1153ca1e50628d295e14e5d3c6e7a59fbff48c60f49b52fc0ef989b27704330385b035bc72790b76e6f1e010aeab2f411f55679fd6646')
_distdir="Test-CheckManifest-1.43"

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
