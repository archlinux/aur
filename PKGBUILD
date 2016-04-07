# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-font-freetype'
pkgver='0.07'
pkgrel='1'
pkgdesc="read font files and render glyphs from Perl using FreeType2"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('freetype2>=2.6.3' 'perl')
makedepends=()
checkdepends=('perl-test-warnings')
url='https://metacpan.org/release/Font-FreeType'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMOL/Font-FreeType-0.07.tar.gz')
md5sums=('058aae0f22416b089804db7f1de6bdf1')
sha512sums=('f245f104f668eeb20fe84c8f05aa9132dd217f58f4d00c34d0318dc7de034ae9577c3f863191b27c52514fd8ef235d5018161015d246abafcc50d0eeb886c95e')
_distdir="Font-FreeType-0.07"

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
