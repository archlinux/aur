# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-inlinex-c2xs'
pkgver='0.22'
pkgrel='2'
pkgdesc="Convert from Inline C code to XS."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline')
makedepends=()
url='http://search.mcpan.org/dist/InlineX-C2XS'
source=('http://search.mcpan.org/CPAN/authors/id/S/SI/SISYPHUS/InlineX-C2XS-0.22.tar.gz')
md5sums=('3c8a8835895919a94b7c2359887b4245')
sha512sums=('ea0326bd1ef398538981b12d5c9f0a8d9194f5e06b528b01f31eec0eb49d625a42b43b574daa359131afc551286991aa017dc57a373256d842542dc77086c264')
_distdir="InlineX-C2XS-0.22"

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
