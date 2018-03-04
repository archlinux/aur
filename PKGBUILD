# CPAN Name  : Test-MockTime
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-mocktime'
pkgver='0.16'
pkgrel='1'
pkgdesc="Replaces actual time with simulated time "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-MockTime'
source=('http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/Test-MockTime-0.16.tar.gz')
md5sums=('624d6976d57a79c9cd14237168424f44')
sha512sums=('158026f9b1590131b51a004c0b8ecc7e190d0bd90da13ae56f645909e30ce6830deae1821874d71a1ad4d0dee84cd9e2b50aeacf7ef1d9cd465332823da0f927')
_distdir="Test-MockTime-0.16"

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
