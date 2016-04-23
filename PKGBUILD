# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-inlinex-c2xs'
pkgver='0.24'
pkgrel='1'
pkgdesc="Convert from Inline C code to XS."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline-c>=0.54')
makedepends=()
checkdepends=('perl-test-warn>=0.24')
url='https://metacpan.org/release/InlineX-C2XS'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/InlineX-C2XS-0.24.tar.gz')
md5sums=('9ca19dc375c7ebb6e1b7597d530040cd')
sha512sums=('702d48c9a97ed596128d1c061e3d0de2d0164b9d423e9c3655aed53ed9fd6a2e3e8d28e2f88dfbbb0560c9511d2d1e96385cc60d1aedbb3edbc26366c8293700')
_distdir="InlineX-C2XS-0.24"

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
