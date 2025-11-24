# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder-compiler'
pkgver='0.029'
pkgrel='3'
pkgdesc="An interface around different compilers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-builder>=0.016' 'perl-extutils-config>=0.007' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder-Compiler'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-Compiler-$pkgver.tar.gz")
md5sums=('8fcdae76b412021ee827318538052a41')
sha512sums=('48549f6cfdab084bd8e36cef86b40d85ad16ced182349a2395978e6a250a9a7ff3bc1ea33111a6c6cbd18ca15eb80561208e57cca8c8b1e9ace0e0e44bd867d9')
_distdir="ExtUtils-Builder-Compiler-$pkgver"

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
