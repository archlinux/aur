# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-sane'
pkgver='0.05'
pkgrel='1'
pkgdesc="Perl extension for the SANE (Scanner Access Now Easy) Project"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'sane>=1.0.24' 'perl-extutils-depends' 'perl-extutils-pkgconfig')
makedepends=('gcc')
url='https://metacpan.org/release/Sane'
source=('http://search.cpan.org/CPAN/authors/id/R/RA/RATCLIFFE/Sane-0.05.tar.gz')
md5sums=('ad42db3b9173a82e02490283665416a5')
sha512sums=('03e67ffbc5d89b3e2b9c7d4c0221c1dadfd4f2ea0c33c761f599e1ea953dbbae24d5d78780d8a3e660550105550901b37a4ec67a3ccaf7c56a1b713e1fc69473')
_distdir="Sane-0.05"

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
