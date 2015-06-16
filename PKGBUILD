# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-spelling'
pkgver='0.20'
pkgrel='1'
pkgdesc="check for spelling errors in POD files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3>=0.044' 'perl-pod-spell>=1.01')
makedepends=('perl-test-simple')
url='https://metacpan.org/release/Test-Spelling'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/Test-Spelling-0.20.tar.gz')
md5sums=('4a22461c1356d99f6a7d29b6e14b5e0c')
sha512sums=('43c401c2e61d7b2365d0cd69abc5f90a570fa3469632843ff8379ae7e85e50fe18786d89023f2aab635a805ecdadcd270ec36c19a7c1fbc5520c7c38604ff5a7')
_distdir="Test-Spelling-0.20"

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
