# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-cleannamespaces'
pkgver='0.16'
pkgrel='1'
pkgdesc="Check for uncleaned imports"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule' 'perl-file-find-rule-perl' 'perl-module-runtime' 'perl-package-stash>=0.14' 'perl-role-tiny>=1.003000' 'perl-sub-exporter' 'perl-sub-identify' 'perl-test-deep' 'perl-test-requires' 'perl-test-tester' 'perl-test-warnings>=0.009' 'perl-namespace-clean')
makedepends=()
url='http://search.mcpan.org/dist/Test-CleanNamespaces'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Test-CleanNamespaces-0.16.tar.gz')
md5sums=('024f6f872d75cd7082aedcf2ad0c38bd')
sha512sums=('e0e82660a7365c8c846ca4e326d51e91d8111cb8de16ca5a9835b8e7ac610d12e5e3bf2ddcaff861b7b38fa86093bfaeca815024867009934bd7e7973775fa6a')
_distdir="Test-CleanNamespaces-0.16"

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
