# Maintainer: Manifest0
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-cleannamespaces'
pkgver='0.23'
pkgrel='2'
pkgdesc="Check for uncleaned imports"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule' 'perl-file-find-rule-perl' 'perl-module-runtime' 'perl-package-stash>=0.14' 'perl-role-tiny>=1.003000' 'perl-sub-exporter' 'perl-sub-identify' 'perl-test-deep' 'perl-test-requires' 'perl-test-tester' 'perl-test-warnings>=0.009' 'perl-namespace-clean')
makedepends=()
url='http://search.mcpan.org/dist/Test-CleanNamespaces'
source=("http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Test-CleanNamespaces-$pkgver.tar.gz")
sha512sums=('c40587c09bcd6a6ebc6801e12a3d33fcd2695b650fe02546a8a6da7d038ba5b1218d730a09f3b8942824a0506aca3edfcbcdf204906569dad5c46816b91e8a99')
_distdir="Test-CleanNamespaces-$pkgver"

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
