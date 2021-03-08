# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-font-freetype
pkgver=0.16
pkgrel=1
pkgdesc="read font files and render glyphs from Perl using FreeType2"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('freetype2>=2.6.3' 'perl')
makedepends=()
checkdepends=('perl-test-warnings' 'perl-devel-checklib' 'perl-file-which')
url='https://metacpan.org/release/Font-FreeType'
_distdir="Font-FreeType-${pkgver}"
source=(https://cpan.metacpan.org/authors/id/D/DM/DMOL/Font-FreeType-${pkgver}.tar.gz)
sha256sums=('b689fe2fa8c890abcfe1a257916a8bedd0806b7c295f1ac70be7b284e31598f3')

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
