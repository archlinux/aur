# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder-compiler'
pkgver='0.036'
pkgrel='1'
pkgdesc="An interface around different compilers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-builder>=0.016' 'perl-extutils-config>=0.007' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder-Compiler'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-Compiler-$pkgver.tar.gz")
md5sums=('bd7c23b4f8ba291bbdac0f1dfb374f99')
sha512sums=('5cd1c7cff92d77c9a9bb5e7855183d91f208fff9cec482f754a7319fbc83fa8caf4b86e4b4f1f827244180615295c43e5e9d10b35ffa36f2d4006aacf72714f7')
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
