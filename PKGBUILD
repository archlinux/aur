# Maintainer: Manifest0
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-cleannamespaces'
pkgver='0.24'
pkgrel='1'
pkgdesc="Check for uncleaned imports"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
checkdepends=('perl-file-pushd' 'perl-test-needs')
depends=('perl-file-find-rule' 'perl-file-find-rule-perl' 'perl-module-runtime' 'perl-package-stash>=0.14' 'perl-role-tiny>=1.003000' 'perl-sub-exporter' 'perl-sub-identify' 'perl-test-deep' 'perl-test-requires' 'perl-test-tester' 'perl-test-warnings>=0.009' 'perl-namespace-clean')
makedepends=()
url='http://search.mcpan.org/dist/Test-CleanNamespaces'
source=("http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Test-CleanNamespaces-$pkgver.tar.gz")
sha512sums=('f99d3dea0af3ae654819c72ed9672234953edf5c8e5f3c6271a578761ee371e2ed670df07a8a8c2adba91c42404ac94b8d479acc91ae16a4536c0f2fd99809a7')
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
