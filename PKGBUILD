# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gd-graph3d'
pkgver='0.63'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-gd>=1.18' 'perl-gdgraph' 'perl-gdtextutil')
makedepends=()
url='https://metacpan.org/release/GD-Graph3d'
source=('http://search.cpan.org/CPAN/authors/id/W/WA/WADG/GD-Graph3d-0.63.tar.gz')
md5sums=('f866dcdd1e7e2056bb946ab7ac3fe37b')
sha512sums=('4792461322e7f37a671c1ec87bceb4591f69a90d328d816b19b7fc1013c053c1d66de2f94511c010bed0a8cc6363ee46f928c864614703d399231e149012d559')
_distdir="GD-Graph3d-0.63"

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
