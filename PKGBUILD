# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-regression'
pkgver='0.07'
pkgrel='1'
pkgdesc="Test library that can be run in two modes; one to generate outputs and a second to compare against them"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-algorithm-diff' 'perl-test-differences' 'perl-test-mockobject' 'perl-text-diff')
makedepends=()
url='https://metacpan.org/release/Test-Regression'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MITHALDU/Test-Regression-0.07.tar.gz')
md5sums=('4b7137917d538e8763ed08ddd6a94606')
sha512sums=('213ce430925d7ae19a70207a840109ffae1be0bdcf757422c3ccb0109b7b7dfa55d0c704d2886346cec3f38c59a7208b71e28626541fe7bfd982b623714c7115')
_distdir="Test-Regression-0.07"

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
