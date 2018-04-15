# CPAN Name  : Test-MockTime
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-mocktime'
pkgver='0.17'
pkgrel='1'
pkgdesc="Replaces actual time with simulated time "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-MockTime'
source=('http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/Test-MockTime-0.17.tar.gz')
md5sums=('3cd809ebccc72b0701afbba51029ac56')
sha512sums=('ad73be430e3a483a61209bacf4bfa170d6eec6597d3c0efcf5de167f9c129fbf656581dcdceeba88bd98e530371db2542894ded793f9d46e4155c612e2b7cac5')
_distdir="Test-MockTime-0.17"

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
